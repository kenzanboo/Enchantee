require 'spec_helper'

describe Interest do
  before(:each) do
    @category=Category.create!(:name => "value for name")
    @valid_attributes = {
      :name => "value for name",
      :category_id => @category.id
    }
  end

  it "should create a new instance given valid attributes" do
    Interest.create!(@valid_attributes)
  end
  
  describe "list of users" do
    before(:each) do
      @interest = Interest.create(@valid_attributes)
    end
    
    it "should have a list of users" do
      @interest.should respond_to(:users)
    end
    
    it "should update itself and the user" do
      user = mock_model(User)
      user.stub(:quoted_id).and_return(1)
      @interest.users << user
    end
  end
end
