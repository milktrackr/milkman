class Container < ActiveRecord::Base
  has_many :measurements
  class << self
    attr_accessor :last_text_message
  end
  
  self.last_text_message = Time.now - 1.day

  def percentage_left
    ((self.measurements.last.mass_value / self.original_mass) * 100.0).round
  end

  def self.total_milk_consumed
  	sum = 0
  	self.all.each do |container|
  		sum += container.original_mass
  	end
  	# In liters (dividing by 1000)
  	(sum - Measurement.last.mass_value)/1000
  end

end
