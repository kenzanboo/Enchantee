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

latitude= 37.875582 + (rand()-0.5)/1000
longitude= -122.25856 + (rand()-0.5)/1000
@max=User.create(:username=>"max", :first_name=>"Max", :last_name=>"Johnson", :password=>"fuckyocouch", :password_confirmation=>"fuckyocouch", :latitude=>latitude, :longitude=>longitude, :photo=>"demo_profile_pics/max.jpg");

latitude= 37.875582 + (rand()-0.5)/1000
longitude= -122.25856 + (rand()-0.5)/1000
@ryan=User.create(:username=>"ryan", :first_name=>"Ryan", :last_name=>"Spore", :password=>"fuckyocouch", :password_confirmation=>"fuckyocouch", :latitude=>latitude, :longitude=>longitude, :photo=>"demo_profile_pics/ryan.jpg");

latitude= 37.875582 + (rand()-0.5)/1000
longitude= -122.25856 + (rand()-0.5)/1000
@serban=User.create(:username=>"serban", :first_name=>"Serban", :last_name=>"Giuroiu", :password=>"fuckyocouch", :password_confirmation=>"fuckyocouch", :latitude=>latitude, :longitude=>longitude, :photo=>"demo_profile_pics/serban.jpg");

latitude= 37.875582 + (rand()-0.5)/1000
longitude= -122.25856 + (rand()-0.5)/1000
@kenzan=User.create(:username=>"kenzan", :first_name=>"Kenzan", :last_name=>"Boo", :password=>"fuckyocouch", :password_confirmation=>"fuckyocouch", :latitude=>latitude, :longitude=>longitude, :photo=>"demo_profile_pics/kenzan.jpg");

music_names=["The Beatles", "Charles Mingus", "Estradasphere", "Blackalicious", "Jeff Beck", "Joshua Redman", "Queen", "Girl Talk", "Muse", "AC/DC", "The Killers", "Pretty Lights", "Bassnectar", "Vivaldi", "Red Hot Chili Peppers"]
movie_names=["Snatch", "Pirates", "WALL-E", "Scarface", "Better Luck Tomorrow", "Catch Me If You Can", "Forrest Gump"]
tv_names=["Friends", "Monster Garage", "Tom and Jerry", "Chappelle's Show", "The Office", "How I Met Your Mother", "South Park"]
tech_names=["Rails", "Cuda", "Cross-Site Scripting", "Linux", "iPhone User Interfaces"]
music_interests=music_names.map do |interest|
  Interest.create(:name=>interest, :category=>Category.find_by_name("Music"))
end
movie_interests=movie_names.map do |interest|
  Interest.create(:name=>interest, :category=>Category.find_by_name("Movies"))
end
television_interests=tv_names.map do |interest|
  Interest.create(:name=>interest, :category=>Category.find_by_name("Television"))
end
tech_interests=tech_names.map do |interest|
  Interest.create(:name=>interest, :category=>Category.find_by_name("Technology"))
end

@serban.interests<<music_interests.values_at(0..7)+movie_interests.values_at(0)+television_interests.values_at(0..2)+tech_interests.values_at(0..1,3)+[Interest.create(:name=>"Rene Magritte", :category=>Category.find_by_name("Art"))]
@max.interests<<music_interests.values_at(0,11,12)+tech_interests.values_at(0,2)+[Interest.create(:name=>"France", :category=>Category.find_by_name("Travel"))]
@ryan.interests<<music_interests.values_at(0,7..10)+movie_interests.values_at(1,2)+television_interests.values_at(3..5)+tech_interests.values_at(0,4)
@kenzan.interests<<music_interests.values_at(13,14)+movie_interests.values_at(3..6)+television_interests.values_at(4..6)+tech_interests.values_at(0,3)