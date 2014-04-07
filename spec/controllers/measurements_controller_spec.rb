require 'spec_helper'

describe MeasurementsController do
  render_views

  before(:each) do
    4.times do
      create(:measurement)
    end

    4.times do
      create(:container)
    end
  end

  it "#index" do
    Measurement.create(:raw => 200)
    get :index
    expect(assigns(:current_measurement)).to eq(Measurement.calculate_grams_from_raw(200))
  end

  it "#new" do
    get :new
    response.should render_template("new")
  end
  
  it "#create" do
  end


  describe "#update" do
  	describe "with valid params" do
  		it "updates the associated record" do
		  	measurement = Measurement.first
		  	new_time = Time.parse("Mon, 07 Apr 2014 11:30:26 EDT -04:00")
		  	patch :update, :id => measurement.id, :measurement => attributes_for(:measurement, :read_time => new_time)
		  	measurement.reload
		  	expect(measurement.read_time).to eq(new_time)
		end
  	end
  end

  it "#destroy" do
  end

  it "#send_text" do
    pending
  end
end
