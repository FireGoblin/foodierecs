class AddBoroughToRestaurants < ActiveRecord::Migration
  def self.up
    add_column :restaurants, :borough, :string
  end

  def self.down
    remove_column :restaurants, :borough
  end
end
