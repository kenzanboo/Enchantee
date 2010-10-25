require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :username => "value for username",
      :password => "value for password",
      :first_name => "value for first_name",
      :last_name => "value for last_name",
      :photo => "value for photo",
      :latitude => 1.5,
      :longitude => 1.5
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end

  describe "list of interests" do
    before(:each) do
      @user = User.create(@valid_attributes)
    end

    it "should have a list of items" do
      @user.should respond_to(:interests)
    end

    it "should update itself and the item" do
      interest = mock_model(Interest)
      interest.stub(:quoted_id).and_return(1)
      @user.interests << interest
    end
  end
end
