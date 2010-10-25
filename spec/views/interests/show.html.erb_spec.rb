require 'spec_helper'

describe "/interests/show.html.erb" do
  include InterestsHelper
  before(:each) do
    assigns[:interest] = @interest = stub_model(Interest,
      :name => "value for name",
      :category_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
  end
end
