require 'spec_helper'

describe NearbyController do
  
  describe "index" do
    it "should redirect to the user list" do
      get :index
      response.should redirect_to(nearby_list_url)
    end
  end
  
  describe "list" do
    before(:each) do
      @zerozero = User.create(:username => "Test",
                  :firstname => "Testing",
                  :lastname => "Tester",
                  :password => "snufflepuss",
                  :password_confirmation => "snufflepuss",
                  :latitude => 0.0,
                  :longitude => 0.0)
    end
    
    it "should display a nearby user" do
      current_user = User.create(:username => "Test2",
                   :firstname => "Testing2",
                   :lastname => "Tester2",
                   :password => "snufflepuss",
                   :password_confirmation => "snufflepuss",
                   :latitude => 0.001,
                   :longitude => 0.001)
      NearbyController.stub(:current_user).and_return(current_user) #mock_model(User, :latitude => 0.001, :longitude => 0.001, :firstname => "Max", :lastname => "Johnson")
      get :list
      assigns[:list].should contain(@zerozero)
    end
    
    it "should not display a distant user" do
      current_user = User.create(:username => "Test2",
                   :firstname => "Testing2",
                   :lastname => "Tester2",
                   :password => "snufflepuss",
                   :password_confirmation => "snufflepuss",
                   :latitude => 0.0,
                   :longitude => 180.0)
      NearbyController.stub(:current_user).and_return(current_user) #mock_model(User, :latitude => 0.001, :longitude => 0.001, :firstname => "Max", :lastname => "Johnson")
      get :list
      assigns[:list].should_not contain(@zerozero)
    end
  end
  
  describe "map" do
    before(:each) do
      @zerozero = User.create(:username => "Test",
                  :firstname => "Testing",
                  :lastname => "Tester",
                  :password => "snufflepuss",
                  :password_confirmation => "snufflepuss",
                  :latitude => 0.0,
                  :longitude => 0.0)
    end
    
    it "should display a nearby user" do
      current_user = User.create(:username => "Test2",
                   :firstname => "Testing2",
                   :lastname => "Tester2",
                   :password => "snufflepuss",
                   :password_confirmation => "snufflepuss",
                   :latitude => 0.001,
                   :longitude => 0.001)
      NearbyController.stub(:current_user).and_return(current_user) #mock_model(User, :latitude => 0.001, :longitude => 0.001, :firstname => "Max", :lastname => "Johnson")
      get :map
      assigns[:map].markers[0].latitude.should == @zerozero.latitude
      assigns[:map].markers[0].longitude.should == @zerozero.longitude
      assigns[:map].markers[0].title.should == @zerozero.name
    end
    
    it "should not display a distant user" do
      current_user = User.create(:username => "Test2",
                   :firstname => "Testing2",
                   :lastname => "Tester2",
                   :password => "snufflepuss",
                   :password_confirmation => "snufflepuss",
                   :latitude => 0.0,
                   :longitude => 180.0)
      NearbyController.stub(:current_user).and_return(current_user) #mock_model(User, :latitude => 0.001, :longitude => 0.001, :firstname => "Max", :lastname => "Johnson")
      get :map
      assigns[:map].markers.should be_empty
    end
  end
end