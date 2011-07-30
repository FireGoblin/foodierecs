class RemoveReferenceFromRestaurants < ActiveRecord::Migration
  def self.up
    remove_column :restaurants, :reference
  end

  def self.down
    add_column :restaurants, :reference, :string
  end
end
