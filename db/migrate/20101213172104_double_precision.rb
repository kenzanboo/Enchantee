class DoublePrecision < ActiveRecord::Migration
  def self.up
    remove_column :users, :latitude
    remove_column :users, :longitude
    add_column :users, :latitude, :float, :limit => 53
    add_column :users, :longitude, :float, :limit => 53
  end

  def self.down
    remove_column :users, :latitude
    remove_column :users, :longitude
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
