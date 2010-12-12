require 'spec_helper'

describe FriendshipsController do

  def mock_friendship(stubs={})
    @mock_friendship ||= mock_model(Friendship, stubs)
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created friendship as @friendship" do
        mock_friendship = mock_friendship(:save => true)
        mock_friendships = mock()
        mock_friendships.should_receive(:build).and_return(mock_friendship)
        mock_user = mock_model(User)
        mock_user.should_receive(:friendships).and_return(mock_friendships)
        mock_user.should_receive(:has_friend_with_id).and_return(false)
        controller.stub(:current_user).and_return(mock_user)
        post :create, :friend_id => 1
        assigns[:friendship].should equal(mock_friendship)
      end

      it "redirects to the friend's profile" do
        mock_friendship = mock_friendship(:save => true)
        mock_friendships = mock()
        mock_friendships.should_receive(:build).and_return(mock_friendship)
        mock_user = mock_model(User)
        mock_user.should_receive(:friendships).and_return(mock_friendships)
        mock_user.should_receive(:has_friend_with_id).and_return(false)
        controller.stub(:current_user).and_return(mock_user)
        post :create, :friend_id => 1
        response.should redirect_to(user_url(1))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved friendship as @friendship" do
        mock_friendship = mock_friendship(:save => true)
        mock_friendships = mock()
        mock_friendships.should_receive(:build).and_return(mock_friendship)
        mock_user = mock_model(User)
        mock_user.should_receive(:friendships).and_return(mock_friendships)
        mock_user.should_receive(:has_friend_with_id).and_return(false)
        controller.stub(:current_user).and_return(mock_user)
        post :create, :friend_id => 1
        assigns[:friendship].should equal(mock_friendship)
      end

      it "redirects to the friend's profile" do
        mock_friendship = mock_friendship(:save => true)
        mock_friendships = mock()
        mock_friendships.should_receive(:build).and_return(mock_friendship)
        mock_user = mock_model(User)
        mock_user.should_receive(:friendships).and_return(mock_friendships)
        mock_user.should_receive(:has_friend_with_id).and_return(false)
        controller.stub(:current_user).and_return(mock_user)
        post :create, :friend_id => 1
        response.should redirect_to(user_url(1))
      end
    end
    
    describe "should fail" do
      it "when a user attempts to bookmark an already-bookmarked user" do
        mock_user = mock_model(User)
        mock_user.should_receive(:has_friend_with_id).with("1").and_return(true)
        controller.stub(:current_user).and_return(mock_user)
        post :create, :friend_id => 1
        assigns[:friendship].should == nil
      end
      
      it "when a user tries to bookmark themself" do
        controller.stub(:current_user).and_return(mock(:id => 1, :has_friend_with_id => false))
        post :create, :friend_id => 1
        assigns[:friendship].should == nil
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested friendship" do
      mock_friendships = mock()
      mock_friendships.should_receive(:find).and_return(mock_friendship(:id => 37, :destroy => true))
      mock_user = mock_model(User)
      mock_user.should_receive(:friendships).and_return(mock_friendships)
      controller.stub(:current_user).and_return(mock_user)
      delete :destroy, :id => "37"
    end

    it "redirects to the user's profile" do
      mock_friendships = mock()
      mock_friendships.should_receive(:find).and_return(mock_friendship(:id => 37, :destroy => true))
      mock_user = mock_model(User, :id => 100)
      mock_user.should_receive(:friendships).and_return(mock_friendships)
      controller.stub(:current_user).and_return(mock_user)
      delete :destroy, :id => "1"
      response.should redirect_to(user_url(100))
    end
  end

end
