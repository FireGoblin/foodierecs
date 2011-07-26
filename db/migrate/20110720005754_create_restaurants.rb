class CreateRestaurants < ActiveRecord::Migration
  def self.up
    create_table :restaurants do |t|
      t.string :name, :limit => 400
      t.string :address, :limit => 400
      t.string :street_number
      t.string :street
      t.string :phone
      t.float :lat
      t.float :long
      t.string :icon
      t.string :google_id
      t.string :reference
      t.string :type1
      t.string :type2
      t.string :type3
      t.string :type4
      t.string :url
      t.string :vicinity
      t.float :rating
      t.integer :foodie_likes
      t.integer :foodie_dislikes
      t.integer :normal_likes
      t.integer :normal_dislikes

      t.timestamps
    end
  end

  def self.down
    drop_table :restaurants
  end
end
