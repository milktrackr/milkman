class Measurement < ActiveRecord::Base
  before_save :convert_raw_to_grams

GRAMS_SLOPE_ROOM_TEMP = 2.395698737
GRAMS_INTERCEPT_ROOM_TEMP = -465.6012396

  def convert_raw_to_grams
    g_uom = 'g'
    g_value = ((self.raw * GRAMS_SLOPE_ROOM_TEMP) + GRAMS_INTERCEPT_ROOM_TEMP).round

    # raw 0-1024
    # kg ~0-6
    # Need to control for noise

    self.mass_value=(g_value)
    self.mass_uom=(g_uom)
  end

  def convert_grams_to_liters
    # Milk density varies from 1.027kg/L to 1.033kg/L. 
    # We'll use 1.030kg/L for simplicity
    milk_density = 1030.0 # g/L

    liter_uom = 'L'
    liter_value = (convert_raw_to_grams[0] / milk_density).round
    [liter_value, liter_uom]
  end

  def percentage_left
  # Might need a container to build this out

  end

end
