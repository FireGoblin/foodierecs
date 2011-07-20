class CreateRestaurants < ActiveRecord::Migration
  def self.up
    create_table :restaurants do |t|
      t.string :name
      t.string :address
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
      t.int :foodie_likes
      t.int :foodie_dislikes
      t.int :normal_likes
      t.int :normal_dislikes

      t.timestamps
    end
  end

  def self.down
    drop_table :restaurants
  end
end
