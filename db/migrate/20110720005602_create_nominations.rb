class CreateNominations < ActiveRecord::Migration
  def self.up
    create_table :nominations do |t|
      t.integer :user_id
      t.boolean :vote
      t.integer :voter
      t.boolean :nominator

      t.timestamps
    end
  end

  def self.down
    drop_table :nominations
  end
end
