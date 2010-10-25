require 'spec_helper'

describe "/interests/new.html.erb" do
  include InterestsHelper

  before(:each) do
    assigns[:interest] = stub_model(Interest,
      :new_record? => true,
      :name => "value for name",
      :category_id => 1
    )
  end

  it "renders new interest form" do
    render

    response.should have_tag("form[action=?][method=post]", interests_path) do
      with_tag("input#interest_name[name=?]", "interest[name]")
      with_tag("input#interest_category_id[name=?]", "interest[category_id]")
    end
  end
end
