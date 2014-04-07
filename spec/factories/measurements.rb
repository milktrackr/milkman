# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :measurement do
  	sequence(:raw){|n| 100 + n}
  	read_time Time.parse("October 17th, 1987 9:00:00 -4:00:00")
  	mass_value 3.14
  	mass_uom "Barbra Streisand"
  end
end
