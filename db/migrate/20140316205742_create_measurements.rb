class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.references :MilkJug, index: true
      t.float :quantity
      t.string :quantity_uom
      t.datetime :measurement_time

      t.timestamps
    end
  end
end
