class DashboardsController < ApplicationController

	def index
		@measurements = Measurement.all
		gon.current_measurement = @measurements.last.mass_value
    gon.all_measurements = []
    @measurements.all.each do |measurement|
      gon.all_measurements<< [measurement.read_time, measurement.mass_value]
    end
	end

end
