require 'spec_helper'

describe "/users/show.html.erb" do
  include UsersHelper
  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :username => "value for username",
      :password => "value for password",
      :first_name => "value for first_name",
      :last_name => "value for last_name",
      :photo => "value for photo",
      :latitude => 1.5,
      :longitude => 1.5
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ username/)
    response.should have_text(/value\ for\ password/)
    response.should have_text(/value\ for\ first_name/)
    response.should have_text(/value\ for\ last_name/)
    response.should have_text(/value\ for\ photo/)
    response.should have_text(/1\.5/)
    response.should have_text(/1\.5/)
  end
end
