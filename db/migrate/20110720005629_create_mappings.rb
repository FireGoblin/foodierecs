class CreateMappings < ActiveRecord::Migration
  def self.up
    create_table :mappings do |t|
      t.int :restaurant_id1
      t.int :restaurant_id2
      t.int :foodies
      t.int :nonfoodie

      t.timestamps
    end
  end

  def self.down
    drop_table :mappings
  end
end
