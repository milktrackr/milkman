class Measurement < ActiveRecord::Base
  belongs_to :container
  before_save :convert_raw_to_grams

  GRAMS_SLOPE_ROOM_TEMP = 2.395698737
  GRAMS_INTERCEPT_ROOM_TEMP = -465.6012396

  def convert_raw_to_grams
    g_uom = 'g'
    g_value = Measurement.calculate_grams_from_raw(self.raw)

    self.mass_value=(g_value)
    self.mass_uom=(g_uom)
  end

  def calculate_liters_from_grams
    # Milk density varies from 1.027kg/L to 1.033kg/L.
    # We'll use 1.030kg/L for simplicity
    milk_density = 1030.0 # g/L

    liter_uom = 'L'
    liter_value = (self.mass_value / milk_density).round(3)
    [liter_value, liter_uom]
  end

  def self.log_new_measurement(params)
    # Assume that we don't want to do any "smoothing" -> 154g->155g, just write 155g
    m = Measurement.new(params)
    if m.is_new_container?
      Container.create( original_mass:  Measurement.calculate_grams_from_raw(params[:raw]),
                        mass_uom:       'g',
                        creation_time:  params[:read_time])
    end
    m.container = Container.last
    m
  end

  def is_new_container?
    # How to determine if there's a new container?
    # Can be adjusted once we have more data
    
    # It is a new container if this is the first measurement taken
    return true if Measurement.all.count == 0

    # It's a new container *IF* current measurement is significantly greater
    # than the last measurement that was greater than measurement_gram_minimum

    # Get the last measurement above the minimum threshold
    min_threshold = 10.0 # grams
    last_record = Measurement.where("mass_value > ?",min_threshold).order(read_time: :desc).limit(1)

    if last_record.empty?
      return true
    else
    # Adjust for the current reading being noisily above the last reading
     noise_tolerance = 5.0 # grams 
     Measurement.calculate_grams_from_raw(self.raw) > last_record[0].mass_value + noise_tolerance  
    end
  end

  def self.calculate_grams_from_raw(raw)
    grams = ((raw.to_f * GRAMS_SLOPE_ROOM_TEMP) + GRAMS_INTERCEPT_ROOM_TEMP).round
    return grams < 0 ? 0 : grams
  end

end
