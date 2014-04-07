class DashboardsController < ApplicationController

  def index
    @measurements = Measurement.all
    @containers = Container.all
    current_container = Container.last
    gon.current_measurement = current_container.measurements.last.mass_value
    gon.current_container_size = current_container.original_mass
    gon.percentage_left = current_container.percentage_left

    gon.all_measurements = []

    @measurements.all.each do |measurement|
      gon.all_measurements << [measurement.read_time.utc.to_i*1000, measurement.mass_value]
    end

  end

end
