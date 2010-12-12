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
  
  describe "interests_in_common_with" do
    before(:each) do
      @interest1 = mock_model(Interest)
      @interest2 = mock_model(Interest)
      @interest3 = mock_model(Interest)
      @interest4 = mock_model(Interest)
      @user = mock_model(User, :interests => [@interest1, @interest2, @interest3])
    end
    
    it "should return 2 when two features are the same" do
      user = User.new(@valid_attributes)
      user.stub(:interests).and_return([@interest1, @interest2, @interest4])
      user.interests_in_common_with(@user).should == 2
    end
    
    it "should return 0 when features are disjoint" do
      user = User.new(@valid_attributes)
      user.stub(:interests).and_return([@interest4])
      user.interests_in_common_with(@user).should == 0
    end
  end
  
  describe "has_friend_with_id" do
    before(:each) do
      @user = User.new(@valid_attributes)
      @user.stub(:friends).and_return([mock(:id => 1), mock(:id => 2)])
    end
    
    it "should return true when the user has a friend with the id specified" do
      @user.has_friend_with_id(1).should be_true
    end
    
    it "should return false when the user has not such friend" do
      @user.has_friend_with_id(3).should be_false
    end
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
