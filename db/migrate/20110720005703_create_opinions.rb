class CreateOpinions < ActiveRecord::Migration
  def self.up
    create_table :opinions do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.boolean :foodie
      t.integer :like
      t.string :to_eat
      t.string :to_drink

      t.timestamps
    end
    add_index :opinions, :user_id
    add_index :opinions, :restaurant_id
  end

  def self.down
    drop_table :opinions
  end
end
