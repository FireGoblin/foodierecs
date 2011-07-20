class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :facebook_url
      t.boolean :foodie

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
