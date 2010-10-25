require 'spec_helper'

describe "/users/index.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:users] = [
      stub_model(User,
        :username => "value for username",
        :password => "value for password",
        :first_name => "value for first_name",
        :last_name => "value for last_name",
        :photo => "value for photo",
        :latitude => 1.5,
        :longitude => 1.5
      ),
      stub_model(User,
        :username => "value for username",
        :password => "value for password",
        :first_name => "value for first_name",
        :last_name => "value for last_name",
        :photo => "value for photo",
        :latitude => 1.5,
        :longitude => 1.5
      )
    ]
  end

  it "renders a list of users" do
    render
    response.should have_tag("tr>td", "value for username".to_s, 2)
    response.should have_tag("tr>td", "value for password".to_s, 2)
    response.should have_tag("tr>td", "value for first_name".to_s, 2)
    response.should have_tag("tr>td", "value for last_name".to_s, 2)
    response.should have_tag("tr>td", "value for photo".to_s, 2)
    response.should have_tag("tr>td", 1.5.to_s, 2)
    response.should have_tag("tr>td", 1.5.to_s, 2)
  end
end
