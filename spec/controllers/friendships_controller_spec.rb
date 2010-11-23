require 'spec_helper'

describe FriendshipsController do

  def mock_friendship(stubs={})
    @mock_friendship ||= mock_model(Friendship, stubs)
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created friendship as @friendship" do
        mock_blah = mock()
        mock_blah.should_receive(:create).and_return(true)
        mock_user = mock_model(User)
        mock_user.should_receive(:friendships).and_return(mock_blah)
        FriendshipsController.stub(:current_user).and_return(mock_user)
        #Friendship.stub(:new).with({'these' => 'params'}).and_return(mock_friendship(:save => true))
        post :create, :friendship => {:these => 'params'}
        assigns[:friendship].should equal(mock_friendship)
      end

      it "redirects to the friend's profile" do
        mock_blah = mock()
        mock_blah.should_receive(:create).and_return(true)
        mock_user = mock_model(User)
        mock_user.should_receive(:friendships).and_return(mock_blah)
        FriendshipsController.stub(:current_user).and_return(mock_user)
        #Friendship.stub(:new).and_return(mock_friendship(:save => true))
        post :create, :friendship => {:friend_id => 1}
        response.should redirect_to(user_url(1))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved friendship as @friendship" do
        mock_blah = mock()
        mock_blah.should_receive(:create).and_return(false)
        mock_user = mock_model(User)
        mock_user.should_receive(:friendships).and_return(mock_blah)
        FriendshipsController.stub(:current_user).and_return(mock_user)
        #Friendship.stub(:new).with({'these' => 'params'}).and_return(mock_friendship(:save => false))
        post :create, :friendship => {:these => 'params'}
        assigns[:friendship].should equal(mock_friendship)
      end

      it "redirects to the friend's profile" do
        mock_blah = mock()
        mock_blah.should_receive(:create).and_return(false)
        mock_user = mock_model(User)
        mock_user.should_receive(:friendships).and_return(mock_blah)
        FriendshipsController.stub(:current_user).and_return(mock_user)
        #Friendship.stub(:new).and_return(mock_friendship(:save => false))
        post :create, :friendship => {:friend_id => 1}
        response.should redirect_to(user_url(1))
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested friendship" do
      FriendshipsController.stub(:current_user).and_return(mock_model(User, :friendships => [mock_friendship(:id => 37)]))
      #Friendship.should_receive(:find).with("37").and_return(mock_friendship)
      mock_friendship.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the user's profile" do
      FriendshipsController.stub(:current_user).and_return(mock_model(User, :id => 100, :friendships => [mock_friendship(:id => 37)]))
      #Friendship.stub(:find).and_return(mock_friendship(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(user_url(100))
    end
  end

end
