require 'spec_helper'

describe Container do
  it "calculates the percentage left in a container" do
    Measurement.log_new_measurement({raw: 800, read_time: Time.now - 80.minutes}).save
    expect(Container.last.percentage_left).to eq(100)
    Measurement.log_new_measurement({raw: 600, read_time: Time.now - 70.minutes}).save
    expect(Container.last.percentage_left).to eq(67)
    Measurement.log_new_measurement({raw: 400, read_time: Time.now - 60.minutes}).save
    expect(Container.last.percentage_left).to eq(34)
    Measurement.log_new_measurement({raw: 401, read_time: Time.now - 50.minutes}).save
    Measurement.log_new_measurement({raw: 200, read_time: Time.now - 40.minutes}).save
    expect(Container.last.percentage_left).to eq(1)
    Measurement.log_new_measurement({raw: 0, read_time: Time.now - 30.minutes}).save
    expect(Container.last.percentage_left).to eq(0)
    Measurement.log_new_measurement({raw: 800, read_time: Time.now - 80.minutes}).save
    expect(Container.last.percentage_left).to eq(100)
  end

  it "calculates total milk consumed in liters" do
    Measurement.log_new_measurement({raw: 800, read_time: Time.now - 80.minutes}).save
    Measurement.log_new_measurement({raw: 200, read_time: Time.now - 70.minutes}).save
    Measurement.log_new_measurement({raw: 1000, read_time: Time.now - 60.minutes}).save
    Measurement.log_new_measurement({raw: 200, read_time: Time.now - 50.minutes}).save
    Measurement.log_new_measurement({raw: 900, read_time: Time.now - 40.minutes}).save
    Measurement.log_new_measurement({raw: 700, read_time: Time.now - 30.minutes}).save
    expect(Container.total_milk_consumed).to eq(3.861)

  end

end
