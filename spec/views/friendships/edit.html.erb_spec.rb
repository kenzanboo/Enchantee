require 'spec_helper'

describe "/friendships/edit.html.erb" do
  include FriendshipsHelper

  before(:each) do
    assigns[:friendship] = @friendship = stub_model(Friendship,
      :new_record? => false,
      :user_id => 1,
      :friend_id => 1
    )
  end

  it "renders the edit friendship form" do
    render

    response.should have_tag("form[action=#{friendship_path(@friendship)}][method=post]") do
      with_tag('input#friendship_user_id[name=?]', "friendship[user_id]")
      with_tag('input#friendship_friend_id[name=?]', "friendship[friend_id]")
    end
  end
end
