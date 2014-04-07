class DashboardsController < ApplicationController

	def index
		
			binding.pry
		@measurements = Measurement.all
		@containers = Container.all
		gon.current_measurement = @measurements.last.mass_value
    
    	gon.all_measurements = []
    
	    @measurements.all.each do |measurement|
	      gon.all_measurements << [measurement.read_time.utc.to_i*1000, measurement.mass_value]
	    end
	
	end

end
