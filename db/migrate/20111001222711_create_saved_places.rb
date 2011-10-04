class CreateSavedPlaces < ActiveRecord::Migration
  def self.up
    create_table :saved_places do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.boolean :foodie

      t.timestamps
    end
  end

  def self.down
    drop_table :saved_places
  end
end
