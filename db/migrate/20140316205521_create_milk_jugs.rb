class CreateMilkJugs < ActiveRecord::Migration
  def change
    create_table :milk_jugs do |t|
      t.string :brand
      t.string :milk_type
      t.float :quantity
      t.string :quantity_uom
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
