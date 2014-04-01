class AddContainerIdToMeasurement < ActiveRecord::Migration
  def change
    add_column :measurements, :container_id, :integer
  end
end
