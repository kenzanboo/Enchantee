class FriendshipsController < ApplicationController
  # POST /friendships
  # POST /friendships.xml
  def create
    @friendship = current_user.friendships.build(params[:friendship])

    respond_to do |format|
      if @friendship.save
        redirect_to(root_url, :notice => 'Added friend.')
      else
        redirect_to(root_url, :notice => 'Unable to add friend.')
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.xml
  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy

    respond_to do |format|
      format.html { redirect_to(friendships_url), :notice => 'Removed bookmarked.' }
      format.xml  { head :ok }
    end
  end
end
