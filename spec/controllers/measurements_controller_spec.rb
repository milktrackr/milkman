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
    get :index
    # expect(response.body).to include(
  end

  it "#new" do
  end
  
  it "should #create a new measurement" do
    post :create, measurement: { raw: 1000, read_time: Time.now, mass_value: 8.01, mass_uom: "g", container_id: 1 }
    expect(Measurement.count).to eq(5)
  end

  it "#update" do
  end

  it "#destroy" do
  end

  it "#send_text" do
    pending
  end
end
