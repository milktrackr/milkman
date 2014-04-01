# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Measurement.create({raw:1000,read_time:Time.now-(1*1800)})
Measurement.create({raw:1000,read_time:Time.now-(2*1800)})
Measurement.create({raw:700,read_time:Time.now-(3*1800)})
Measurement.create({raw:700,read_time:Time.now-(4*1800)})
Measurement.create({raw:700,read_time:Time.now-(5*1800)})
Measurement.create({raw:0,read_time:Time.now-(6*1800)})
Measurement.create({raw:500,read_time:Time.now-(7*1800)})
Measurement.create({raw:500,read_time:Time.now-(8*1800)})
Measurement.create({raw:500,read_time:Time.now-(9*1800)})
Measurement.create({raw:400,read_time:Time.now-(10*1800)})
Measurement.create({raw:400,read_time:Time.now-(11*1800)})
Measurement.create({raw:400,read_time:Time.now-(12*1800)})
Measurement.create({raw:300,read_time:Time.now-(13*1800)})
Measurement.create({raw:300,read_time:Time.now-(14*1800)})
Measurement.create({raw:0,read_time:Time.now-(15*1800)})
Measurement.create({raw:0,read_time:Time.now-(16*1800)})
Measurement.create({raw:1000,read_time:Time.now-(17*1800)})
Measurement.create({raw:1000,read_time:Time.now-(18*1800)})