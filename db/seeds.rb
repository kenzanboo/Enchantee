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
names_list_soda=["Brian Harvey", "Dan Garcia", "David Patterson", "Christos Papadimitriou", "David Wagner", "Babak Ayazifar", "Bernhard Boser", "Ali Niknejad", "Edward A. Lee", "Ronald S. Fearing"];
names_list_gspp=["Barack Obama", "John Boehner", "Nancy Pelosi", "Dick Cheney", "Ron Paul", "Stephen Colbert", "Rush Limbaugh", "John Stewart", "Bill O'Reilly", "Lewis Black"];
names_list_th=["Inigo Montoya", "Arthur Dent", "Zaphod Beeblebrox", "Patches O'Houlihan", "Ron Burgandy", "Master Chief", "Captain Falcon", "Super Mario", "Star Fox", "Samus Aran"];
names_list_univ=["Chuck Norris", "Mr. T", "Bruce Wayne", "Tony Stark", "Sheldon Cooper", "Sad Keanu", "Leeroy Jenkins", "Antoine Dodson", "The Game", "Over 9000"];

music_list=["50 Cent", "Taylor Swift", "Rick Astley", "AC/DC", "Daft Punk"];

music_list.each do |interest|
  Interest.create(:name=>interest, :category=>Category.find_by_name("Music"))
end

movies_list=["The Matrix", "Inception", "Avatar", "WALL-E", "Serenity"];

movies_list.each do |interest|
  Interest.create(:name=>interest, :category=>Category.find_by_name("Movies"))
end

tv_interests=["House MD", "Dora the Explorer", "Power Rangers", "Crossfire", "Days of Our Lives"]

movies_list.each do |interest|
  Interest.create(:name=>interest, :category=>Category.find_by_name("Television"))
end

interest_count = Interest.count-1

names_list_soda.each do |name|
  latitude= 37.875582 + (rand()-0.5)/1000
  longitude= -122.25856 + (rand()-0.5)/1000
  testuser=User.create(:username=>name, :first_name=> name.split.first, :last_name=> name.split.last, :password=>"fuckyocouch", :password_confirmation=>"fuckyocouch", :latitude=>latitude, :longitude=>longitude);
  interest_nums=[];
  12.times do interest_nums<<(rand(interest_count)+1) end
  interest_nums.uniq.each do |interest_num|
    testuser.interests<<Interest.first(:conditions => [ "id >= ?", interest_num])
  end
end

names_list_gspp.each do |name|
  latitude= 37.875669 + (rand()-0.5)/1000
  longitude= -122.258024 + (rand()-0.5)/1000
  testuser=User.create(:username=>name, :first_name=> name.split.first, :last_name=> name.split.last, :password=>"fuckyocouch", :password_confirmation=>"fuckyocouch", :latitude=>latitude, :longitude=>longitude);
  interest_nums=[];
  12.times do interest_nums<<(rand(interest_count)+1) end
  interest_nums.uniq.each do |interest_num|
    testuser.interests<<Interest.first(:conditions => [ "id >= ?", interest_num])
  end
  if(testuser.first_name=="Bill")
    testuser.interests<<Interest.create(:name=>"Doing it live!!!!!", :category_id=>6)
  end
end

names_list_th.each do |name|
  latitude= 37.877038 + (rand()-0.5)/1000
  longitude= -122.258466 + (rand()-0.5)/1000
  testuser=User.create(:username=>name, :first_name=> name.split.first, :last_name=> name.split.last, :password=>"fuckyocouch", :password_confirmation=>"fuckyocouch", :latitude=>latitude, :longitude=>longitude);
  interest_nums=[];
  12.times do interest_nums<<(rand(interest_count)+1) end
  interest_nums.uniq.each do |interest_num|
    testuser.interests<<Interest.first(:conditions => [ "id >= ?", interest_num])
  end
end

names_list_univ.each do |name|
  latitude= 37.87155 + (rand()-0.5)/1000
  longitude= -122.27295 + (rand()-0.5)/1000
  testuser=User.create(:username=>name, :first_name=> name.split.first, :last_name=> name.split.last, :password=>"fuckyocouch", :password_confirmation=>"fuckyocouch", :latitude=>latitude, :longitude=>longitude);
  interest_nums=[];
  12.times do interest_nums<<(rand(interest_count)+1) end
  interest_nums.uniq.each do |interest_num|
    testuser.interests<<Interest.first(:conditions => [ "id >= ?", interest_num])
  end
end