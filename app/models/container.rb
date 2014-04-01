class Container < ActiveRecord::Base
  has_many :measurements

  def percentage_left
    ((self.measurements.last.mass_value / self.original_mass) * 100.0).round
  end

end
