# 
#
# I created some sample data to get us started.
# The amount of milk left is pretty linear right now. 
# We might want to make it more random down the line.
#
#
######## Milk Jug #1 ########

milkjug1_start_time = DateTime.parse('15th Mar 2014 04:05:06 PM') 

milkjug1 = MilkJug.create({ brand: "Horizon", milk_type: "2%",
                            quantity: 1, quantity_uom: "gal",
                            start_time: milkjug1_start_time
                          })

milk_jug_id = MilkJug.last.id

101.times do |i|
  Measurement.create({MilkJug_id: milk_jug_id,
                     quantity: (milkjug1.quantity - (i*(milkjug1.quantity / 100))),
                     quantity_uom: "gal",
                     measurement_time: (milkjug1_start_time + ((30*i).minutes))
                     })
end

milkjug1.end_time = Measurement.last.measurement_time
milkjug1.save

#############################

######## Milk Jug #2 ########

milkjug2_start_time = milkjug1.end_time + 3.days

milkjug2 = MilkJug.create({ brand: "Whole Foods Brand", milk_type: "Whole",
                            quantity: 0.5, quantity_uom: "gal",
                            start_time: milkjug1_start_time
                          })

milk_jug_id = MilkJug.last.id

101.times do |i|
  Measurement.create({MilkJug_id: milk_jug_id,
                     quantity: (milkjug2.quantity - (i*(milkjug2.quantity / 100))),
                     quantity_uom: "gal",
                     measurement_time: (milkjug2_start_time + ((30*i).minutes))
                     })
end

milkjug2.end_time = Measurement.last.measurement_time
milkjug2.save

