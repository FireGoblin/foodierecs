class CreateMappings < ActiveRecord::Migration
  def self.up
    create_table :mappings do |t|
      t.integer :restaurant_id1
      t.integer :restaurant_id2
      t.integer :foodies
      t.integer :nonfoodie

      t.timestamps
    end
  end

  def self.down
    drop_table :mappings
  end
end
