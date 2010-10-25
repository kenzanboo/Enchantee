require 'spec_helper'

describe Category do
  before(:each) do
    @valid_attributes = {
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    Category.create!(@valid_attributes)
  end

  describe "list of interests" do
    before(:each) do
      @category = Category.create(@valid_attributes)
    end
    
    it "should have an interests property" do
      @category.respond_to?(:interests).should be_true
    end
    
    it "should update interest objects added to it" do
      interest = mock_model(Interest)
      interest.should_receive(:[]=).with("category_id", 1)
      interest.should_receive(:save).and_return(true)
      @category.interests << interest
    end
  end
end
