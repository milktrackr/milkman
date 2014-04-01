require 'spec_helper'

describe Measurement do
  pending "add some examples to (or delete) #{__FILE__}"

  it "calculates grams given a raw value"
    expect(calculate_grams_from_raw(200).to eq(14)
  end

  it "converts and saves raw values to grams"
    m = Measurement.save(raw: 200)
    expect(m.mass_uom.to eq('g')
    expect(m.mass_value.to eq(14)
  end

  it "calculates liters given a grams"
    m = Measurement.save(raw: 200)
    liter_arr = m.calculate_liters_from_grams
    expect(liter_arr[0].to eq('L')
    expect(liter_arr[1].to eq(0.001)
  end

  it "knows whether a new container has been added"
    Measurement.save(raw: 800, read_time: Time.now - 80.minutes)
    Measurement.save(raw: 600, read_time: Time.now - 70.minutes)
    Measurement.save(raw: 500, read_time: Time.now - 60.minutes)
    Measurement.save(raw: 0, read_time: Time.now - 50.minutes)
    Measurement.save(raw: 0, read_time: Time.now - 40.minutes)
    Measurement.save(raw: 0, read_time: Time.now - 30.minutes)
    expect(is_new_container?({raw: 800,read_time: Time.now}).to eq(true)
    expect(is_new_container?({raw: 400,read_time: Time.now}).to eq(false)
  end

  it "logs a new measurement"
    Measurement.log_new_measurement({raw: 400,read_time: Time.now})
    m = Measurement.last
    expect(m.raw.to eq(400)
    expect(m.mass_uom.to eq('g')
  end

end