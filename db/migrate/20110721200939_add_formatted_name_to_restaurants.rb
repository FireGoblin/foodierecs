class AddFormattedNameToRestaurants < ActiveRecord::Migration
  def self.up
    add_column :restaurants, :formatted_name, :string
  end

  def self.down
    remove_column :restaurants, :formatted_name
  end
end
