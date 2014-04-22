class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :state
      t.integer :population_density

      t.timestamps
    end
  end
end
