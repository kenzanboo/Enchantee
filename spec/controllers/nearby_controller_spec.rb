require 'spec_helper'

describe NearbyController do
  
  describe "index" do
    it "should redirect to the user list" do
      current_user = User.create(:username => "Test2",
                   :first_name => "Testing2",
                   :last_name => "Tester2",
                   :password => "snufflepuss",
                   :password_confirmation => "snufflepuss",
                   :latitude => 0.0,
                   :longitude => 180.0)
      controller.stub(:current_user).and_return(current_user) #mock_model(User, :latitude => 0.001, :longitude => 0.001, :first_name => "Max", :last_name => "Johnson")
      get :index
      response.should redirect_to(nearby_map_url)
    end
  end
  
  describe "list" do
    before(:each) do
      @zerozero = User.create(:username => "Test",
                  :first_name => "Testing",
                  :last_name => "Tester",
                  :password => "snufflepuss",
                  :password_confirmation => "snufflepuss",
                  :latitude => 0.0,
                  :longitude => 0.0)
    end
    
    it "should display a nearby user" do
      current_user = User.create(:username => "Test2",
                   :first_name => "Testing2",
                   :last_name => "Tester2",
                   :password => "snufflepuss",
                   :password_confirmation => "snufflepuss",
                   :latitude => 0.001,
                   :longitude => 0.001)
      controller.stub(:current_user).and_return(current_user) #mock_model(User, :latitude => 0.001, :longitude => 0.001, :first_name => "Max", :last_name => "Johnson")
      get :list
      assigns[:users].should include(@zerozero)
    end
    
    it "should not display a distant user" do
      current_user = User.create(:username => "Test2",
                   :first_name => "Testing2",
                   :last_name => "Tester2",
                   :password => "snufflepuss",
                   :password_confirmation => "snufflepuss",
                   :latitude => 0.0,
                   :longitude => 180.0)
      controller.stub(:current_user).and_return(current_user) #mock_model(User, :latitude => 0.001, :longitude => 0.001, :first_name => "Max", :last_name => "Johnson") 
      get :list
      assigns[:users].should_not include(@zerozero)
    end
  end
  
  describe "map" do
    before(:each) do
      @zerozero = User.create(:username => "Test",
                  :first_name => "Testing",
                  :last_name => "Tester",
                  :password => "snufflepuss",
                  :password_confirmation => "snufflepuss",
                  :latitude => 0.0,
                  :longitude => 0.0)
    end
    
    it "should display a nearby user" do
      current_user = User.create(:username => "Test2",
                   :first_name => "Testing2",
                   :last_name => "Tester2",
                   :password => "snufflepuss",
                   :password_confirmation => "snufflepuss",
                   :latitude => 0.001,
                   :longitude => 0.001)
      controller.stub(:current_user).and_return(current_user) #mock_model(User, :latitude => 0.001, :longitude => 0.001, :first_name => "Max", :last_name => "Johnson")
      get :map
      assigns[:map].markers[1].latitude.should == @zerozero.latitude
      assigns[:map].markers[1].longitude.should == @zerozero.longitude
      assigns[:map].markers[1].title.should == @zerozero.name
    end
    
    it "should not display a distant user" do
      current_user = User.create(:username => "Test2",
                   :first_name => "Testing2",
                   :last_name => "Tester2",
                   :password => "snufflepuss",
                   :password_confirmation => "snufflepuss",
                   :latitude => 0.0,
                   :longitude => 180.0)
      controller.stub(:current_user).and_return(current_user) #mock_model(User, :latitude => 0.001, :longitude => 0.001, :first_name => "Max", :last_name => "Johnson")
      get :map
      assigns[:map].markers.length.should == 1
    end
  end
end