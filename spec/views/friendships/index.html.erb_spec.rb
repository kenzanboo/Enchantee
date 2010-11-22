require 'spec_helper'

describe "/friendships/index.html.erb" do
  include FriendshipsHelper

  before(:each) do
    assigns[:friendships] = [
      stub_model(Friendship,
        :user_id => 1,
        :friend_id => 1
      ),
      stub_model(Friendship,
        :user_id => 1,
        :friend_id => 1
      )
    ]
  end

  it "renders a list of friendships" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
