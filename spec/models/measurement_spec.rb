require 'spec_helper'

describe Measurement do

  it "calculates grams given a raw value" do
    m = Measurement.new(raw: 200)
    expect(Measurement.calculate_grams_from_raw(200)).to eq(14)
    expect(Measurement.calculate_grams_from_raw(-200)).to eq(0)
  end

  it "converts and saves raw values to grams" do
    m = Measurement.create(raw: 200)
    expect(m.mass_uom).to eq('g')
    expect(m.mass_value).to eq(14)

    m2 = Measurement.create(raw: -200)
    expect(m2.mass_uom).to eq('g')
    expect(m2.mass_value).to eq(0)
  end

  it "calculates liters given a grams" do
    m = Measurement.create(raw: 200)
    liter_arr = m.calculate_liters_from_grams
    expect(liter_arr[0]).to eq(0.014)
    expect(liter_arr[1]).to eq('L')
  end

  it "knows whether a new container has been added" do
    Measurement.log_new_measurement({raw: 800, read_time: Time.now - 80.minutes}).save
    Measurement.log_new_measurement({raw: 600, read_time: Time.now - 70.minutes}).save
    Measurement.log_new_measurement({raw: 500, read_time: Time.now - 60.minutes}).save
    Measurement.log_new_measurement({raw: 0, read_time: Time.now - 50.minutes}).save
    Measurement.log_new_measurement({raw: 0, read_time: Time.now - 40.minutes}).save
    m = Measurement.new(raw: 800, read_time: Time.now - 30.minutes)
    m2 = Measurement.new(raw: 400, read_time: Time.now - 20.minutes)
    m3 = Measurement.new(raw: 401, read_time: Time.now - 10.minutes)
    expect(m.is_new_container?).to eq(true)
    expect(m2.is_new_container?).to eq(false)
    expect(m3.is_new_container?).to eq(false)
    expect(Container.all.count).to eq(1)
  end

  it "logs a new measurement" do
    Measurement.log_new_measurement({raw: 400,read_time: Time.now}).save
    m = Measurement.last
    expect(m.raw).to eq(400)
    expect(m.mass_uom).to eq('g')
  end

end