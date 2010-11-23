require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :username => "value for username",
      :password => "value for password",
      :password_confirmation => "value for password",
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
  
  it "should properly construct a full name" do
    @user = User.create(@valid_attributes)
    @user.should_receive(:name).and_return("value for first_name value for last_name")
    @user.name
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
    
    describe "interest_attributes=" do
      it "should add each interest to @user.interests" do
        interest=mock_model(Interest)
        attributes={:empty => :hash}
        Interest.should_receive(:find_or_create_by_name).and_return(interest)
        @user.interests.should_receive(:<<).with(interest)
        @user.interest_attributes=attributes
      end
    end
    
    describe "save_interests" do
      it "should save each interest in @user.interests" do
        interest=mock_model(Interest)
        @user.stub(:interests).and_return([interest])
        interest.should_receive(:save)
        @user.save_interests
      end
    end
  end
end
