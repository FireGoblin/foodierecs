class CreateOpinions < ActiveRecord::Migration
  def self.up
    create_table :opinions do |t|
      t.int :user_id
      t.int :restaurant_id
      t.boolean :foodie
      t.int :like
      t.string :to_eat
      t.string :to_drink

      t.timestamps
    end
  end

  def self.down
    drop_table :opinions
  end
end
