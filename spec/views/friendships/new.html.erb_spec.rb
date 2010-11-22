require 'spec_helper'

describe "/friendships/new.html.erb" do
  include FriendshipsHelper

  before(:each) do
    assigns[:friendship] = stub_model(Friendship,
      :new_record? => true,
      :user_id => 1,
      :friend_id => 1
    )
  end

  it "renders new friendship form" do
    render

    response.should have_tag("form[action=?][method=post]", friendships_path) do
      with_tag("input#friendship_user_id[name=?]", "friendship[user_id]")
      with_tag("input#friendship_friend_id[name=?]", "friendship[friend_id]")
    end
  end
end
