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
names_list_soda_1=["Brian Harvey", "Dan Garcia", "David Patterson", "Christos Papadimitriou", "David Wagner", ];
names_list_soda_2=["Babak Ayazifar", "Bernhard Boser", "Ali Niknejad", "Edward A. Lee", "Ronald S. Fearing"];
names_list_gspp_1=["Barack Obama", "John Boehner", "Nancy Pelosi", "Dick Cheney", "Ron Paul"];
names_list_gspp_2=["Stephen Colbert", "Rush Limbaugh", "John Stewart", "Bill O'Reilly", "Lewis Black"];
names_list_th_1=["Inigo Montoya", "Arthur Dent", "Zaphod Beeblebrox", "Patches O'Houlihan", "Ron Burgandy"];
names_list_th_2=["Master Chief", "Captain Falcon", "Super Mario", "Star Fox", "Samus Aran"];
names_list_univ_1=["Chuck Norris", "Mr. T", "Bruce Wayne", "Tony Stark", "Sheldon Cooper"];
names_list_univ_2=["Sad Keanu", "Leeroy Jenkins", "Antoine Dodson", "The Game", "Over 9000"];

music_list=["50 Cent", "Taylor Swift", "Rick Astley", "AC/DC", "Daft Punk"];

music_interests=music_list.map do |interest|
  Interest.create(:name=>interest, :category=>Category.find_by_name("Music"))
end

movies_list=["The Matrix", "Inception", "Avatar", "WALL-E", "Serenity"];

movie_interests=movies_list.map do |interest|
  Interest.create(:name=>interest, :category=>Category.find_by_name("Movies"))
end

names_list_soda_1.each do |name|
  latitude= 37.875582 + (rand()-0.5)/10000
  longitude= -122.25856 + (rand()-0.5)/10000
  testuser=User.create(:username=>name, :first_name=> name.split.first, :last_name=> name.split.last, :password=>"fuckyocouch", :password_confirmation=>"fuckyocouch", :latitude=>latitude, :longitude=>longitude);
  testuser.interests<<music_interests;
end

names_list_soda_2.each do |name|
  latitude= 37.875582 + (rand()-0.5)/10000
  longitude= -122.258024 + (rand()-0.5)/10000
  testuser=User.create(:username=>name, :first_name=> name.split.first, :last_name=> name.split.last, :password=>"fuckyocouch", :password_confirmation=>"fuckyocouch", :latitude=>latitude, :longitude=>longitude);
  testuser.interests<<movie_interests;
end

names_list_gspp_1.each do |name|
  latitude= 37.875669 + (rand()-0.5)/10000
  longitude= -122.258024 + (rand()-0.5)/10000
  testuser=User.create(:username=>name, :first_name=> name.split.first, :last_name=> name.split.last, :password=>"fuckyocouch", :password_confirmation=>"fuckyocouch", :latitude=>latitude, :longitude=>longitude);
  testuser.interests<<music_interests;
end

names_list_gspp_2.each do |name|
  latitude= 37.875669 + (rand()-0.5)/10000
  longitude= -122.258466 + (rand()-0.5)/10000
  testuser=User.create(:username=>name, :first_name=> name.split.first, :last_name=> name.split.last, :password=>"fuckyocouch", :password_confirmation=>"fuckyocouch", :latitude=>latitude, :longitude=>longitude);
  testuser.interests<<movie_interests;
end

names_list_th_1.each do |name|
  latitude= 37.877038 + (rand()-0.5)/10000
  longitude= -122.258466 + (rand()-0.5)/10000
  testuser=User.create(:username=>name, :first_name=> name.split.first, :last_name=> name.split.last, :password=>"fuckyocouch", :password_confirmation=>"fuckyocouch", :latitude=>latitude, :longitude=>longitude);
  testuser.interests<<music_interests;
end

names_list_th_2.each do |name|
  latitude= 37.877038 + (rand()-0.5)/10000
  longitude= -122.258466 + (rand()-0.5)/10000
  testuser=User.create(:username=>name, :first_name=> name.split.first, :last_name=> name.split.last, :password=>"fuckyocouch", :password_confirmation=>"fuckyocouch", :latitude=>latitude, :longitude=>longitude);
  testuser.interests<<movie_interests;
end

names_list_univ_1.each do |name|
  latitude= 37.87155 + (rand()-0.5)/10000
  longitude= -122.27295 + (rand()-0.5)/10000
  testuser=User.create(:username=>name, :first_name=> name.split.first, :last_name=> name.split.last, :password=>"fuckyocouch", :password_confirmation=>"fuckyocouch", :latitude=>latitude, :longitude=>longitude);
  testuser.interests<<music_interests;
end

names_list_univ_2.each do |name|
  latitude= 37.87155 + (rand()-0.5)/10000
  longitude= -122.27295 + (rand()-0.5)/10000
  testuser=User.create(:username=>name, :first_name=> name.split.first, :last_name=> name.split.last, :password=>"fuckyocouch", :password_confirmation=>"fuckyocouch", :latitude=>latitude, :longitude=>longitude);
  testuser.interests<<movie_interests;
end