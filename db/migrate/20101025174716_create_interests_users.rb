class CreateInterestsUsers < ActiveRecord::Migration
  def self.up
    create_table :interests_users, :id => false do |t|
      t.integer :interest_id, :null => false
      t.integer :user_id, :null => false
    end
    
    # Add index to speed up lookups, and to ensure uniqueness
    add_index :interests_users, [:interest_id, :user_id], :unique => true
  end

  def self.down
    remove_index :interests_users, :column => [:interest_id, :user_id]
    drop_table :interests_users
  end
end
