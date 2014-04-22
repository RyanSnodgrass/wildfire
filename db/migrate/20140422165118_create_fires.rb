class CreateFires < ActiveRecord::Migration
  def change
    create_table :fires do |t|
      t.string :started_by
      t.integer :acres
      t.boolean :still_burning
      t.integer :location_id

      t.timestamps
    end
  end
end
