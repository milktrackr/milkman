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


  it "#update" do
  end

  it "#destroy" do
  end

  it "#send_text" do
    pending
  end
end
