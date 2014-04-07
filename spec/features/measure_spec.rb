require "spec_helper"

feature "Measure management" do
  scenario "User creates a new measurement" do
    visit "measurements/new"

    fill_in "Raw", :with => 22000
    select '2011', :from => 'measurement_read_time_1i'
    select 'January', :from => 'measurement_read_time_2i'
    select '11', :from => 'measurement_read_time_3i'
    select '11 PM', :from => 'measurement_read_time_4i'
    select '15', :from => 'measurement_read_time_5i'


    click_button "Create Measurement"

    expect(page).to have_text("Measurement was successfully created.")
    expect(Measurement.last.raw).to eq(22000)
    expect(Measurement.last.read_time).to eq("2011-01-12 04:15:00")
  end
end