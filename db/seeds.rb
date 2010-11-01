# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
category_list=["Music", "Sports", "Politics", "Fashion", "Movies", "Television", "Art", "Travel", "Technology", "Academics", "Food", "Gossip"]
@categories=category_list.map do |category|
  Category.create(:name=>category)
end