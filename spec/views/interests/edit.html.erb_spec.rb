require 'spec_helper'

describe "/interests/edit.html.erb" do
  include InterestsHelper

  before(:each) do
    assigns[:interest] = @interest = stub_model(Interest,
      :new_record? => false,
      :name => "value for name",
      :category_id => 1
    )
  end

  it "renders the edit interest form" do
    render

    response.should have_tag("form[action=#{interest_path(@interest)}][method=post]") do
      with_tag('input#interest_name[name=?]', "interest[name]")
      with_tag('input#interest_category_id[name=?]', "interest[category_id]")
    end
  end
end
