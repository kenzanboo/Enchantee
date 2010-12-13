class FriendshipsController < ApplicationController
  # POST /friendships
  # POST /friendships.xml
  def create
    unless current_user.id == params[:friend_id] or current_user.has_friend_with_id params[:friend_id]
      @friendship = current_user.friendships.build(:friend_id => params[:friend_id])

      if @friendship.save
        redirect_to(user_path(params[:friend_id]), :notice => 'Added friend.'); return
      end
    end
    redirect_to(user_path(params[:friend_id]), :notice => 'Unable to add friend.')
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.xml
  def destroy
    @friendship = current_user.friendships.find_by_friend_id(params[:friend_id])
    @friendship.destroy
    redirect_to(user_path(current_user), :notice => 'Removed bookmarked.')
  end
end
