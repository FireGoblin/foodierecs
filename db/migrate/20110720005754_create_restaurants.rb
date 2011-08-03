class CreateRestaurants < ActiveRecord::Migration
  def self.up
    create_table :restaurants do |t|
      t.string :name, :limit => 400
      t.string :address, :limit => 400
      t.string :street_number, :limit => 400
      t.string :street, :limit => 400
      t.string :phone, :limit => 400
      t.float :lat
      t.float :long
      t.string :icon, :limit => 400
      t.string :google_id, :limit => 400
      t.string :reference, :limit => 500
      t.string :type1, :limit => 400
      t.string :type2, :limit => 400
      t.string :type3, :limit => 400
      t.string :type4, :limit => 400
      t.string :url, :limit => 400
      t.string :vicinity, :limit => 400
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
