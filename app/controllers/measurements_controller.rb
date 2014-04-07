class MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create

  # GET /measurements
  # GET /measurements.json
  def index
    @measurements = Measurement.all
    #this is the only variable that gets displayed
    binding.pry
    @current_measurement = @measurements.last.mass_value
    gon.current_measurement = @current_measurement
  end

  # GET /measurements/1
  # GET /measurements/1.json
  def show
  end

  # GET /measurements/new
  def new
    @measurement = Measurement.new
  end

  # GET /measurements/1/edit
  def edit
  end

  # POST /measurements
  # POST /measurements.json
  def create
    #Convert Arduino Output
    @measurement = Measurement.log_new_measurement(measurement_params)

    respond_to do |format|
      if @measurement.save
        if @measurement.container.percentage_left < 10 && !Container.last_text_message.today?
          send_text(@measurement.mass_value)
        end
        format.html { redirect_to @measurement, notice: 'Measurement was successfully created.' }
        format.json { render action: 'show', status: :created, location: @measurement }
      else
        format.html { render action: 'new' }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measurements/1
  # PATCH/PUT /measurements/1.json
  def update
    respond_to do |format|
      if @measurement.update(measurement_params)
        format.html { redirect_to @measurement, notice: 'Measurement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measurements/1
  # DELETE /measurements/1.json
  def destroy
    @measurement.destroy
    respond_to do |format|
      format.html { redirect_to measurements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measurement_params
      params.require(:measurement).permit(:raw, :read_time)
    end

    def send_text(mass)
      account_sid = ENV["TWILIO_ACCNT_SID"]
      auth_token = ENV["TWILIO_AUTH_TOKEN"]

      @client = Twilio::REST::Client.new account_sid, auth_token

      @client.account.messages.create(
        :from => '+13472271984',
        :to => ENV["TWILIO_TO_NUM"],
        :body => "Holy cow you're almost out of milk! You have #{mass} ml of milk left!"
      )
      Container.last_text_message = Time.now
    end
end
