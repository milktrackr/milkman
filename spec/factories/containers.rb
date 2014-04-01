# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :container do
    original_mass 1.5
    mass_uom "MyString"
    creation_time "2014-04-01 14:02:02"
  end
end
