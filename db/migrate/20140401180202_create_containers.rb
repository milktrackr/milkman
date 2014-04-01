class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.float :original_mass
      t.string :mass_uom
      t.datetime :creation_time

      t.timestamps
    end
  end
end
