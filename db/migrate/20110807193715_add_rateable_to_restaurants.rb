class AddRateableToRestaurants < ActiveRecord::Migration
  def self.up
    add_column :restaurants, :rateable, :int
  end

  def self.down
    remove_column :restaurants, :rateable
  end
end
