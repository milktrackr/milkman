class DashboardsController < ApplicationController
  include ActionView::Helpers::DateHelper

  def index
    @measurements = Measurement.all
    @containers = Container.all
    current_container = Container.last
    gon.current_measurement = current_container.measurements.last.mass_value
    gon.current_container_size = current_container.original_mass
    gon.percentage_left = current_container.percentage_left

    gon.all_measurements = []

    @measurements.all.each do |measurement|
      gon.all_measurements << [measurement.read_time.utc.to_i*1000, measurement.mass_value]
    end

  end

  def update
    data_hash = {}
    @containers = Container.all

    if params[:after].to_i == Measurement.last.id
      data_hash = {id: -1}
    else
      id = params[:after].to_i + 1
      puts "||||||||" + id.to_s
      @new_measurements = Measurement.find(id)
      data_hash[:mass_value] = @new_measurements[:mass_value]
      data_hash[:id] = @new_measurements[:id]
      data_hash[:read_time] = @new_measurements[:read_time]
      data_hash[:measurements_count] = @new_measurements[:id]
      data_hash[:containers_count] = @containers.count
      data_hash[:containers_total_milk] = @containers.total_milk_consumed
      data_hash[:time_ago] = time_ago_in_words(@containers.last.creation_time)
    end

    render :json => data_hash
  end

  def realtime
    @measurements = Measurement.all
    @containers = Container.all
    gon.last_id = Measurement.last.id
    current_container = Container.last
    gon.current_measurement = current_container.measurements.last.mass_value
    gon.current_container_size = current_container.original_mass
    gon.percentage_left = current_container.percentage_left

    gon.all_measurements = []

    @measurements.all.each do |measurement|
      gon.all_measurements << [measurement.read_time.utc.to_i*1000, measurement.mass_value]
    end

  end

end
