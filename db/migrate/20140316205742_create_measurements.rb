class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.integer   :raw
      t.datetime  :read_time
      t.float     :mass_value
      t.string    :mass_uom

      t.timestamps
    end
  end
end
