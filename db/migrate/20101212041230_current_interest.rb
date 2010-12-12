class CurrentInterest < ActiveRecord::Migration
  def self.up
    add_column :users, :current_interest_id, :integer, :default=>0
  end

  def self.down
    remove_column :users, :current_interest_id
  end
end
