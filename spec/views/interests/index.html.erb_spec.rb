require 'spec_helper'

describe "/interests/index.html.erb" do
  include InterestsHelper

  before(:each) do
    assigns[:interests] = [
      stub_model(Interest,
        :name => "value for name",
        :category_id => 1
      ),
      stub_model(Interest,
        :name => "value for name",
        :category_id => 1
      )
    ]
  end

  it "renders a list of interests" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
