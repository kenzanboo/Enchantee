require 'spec_helper'

describe InterestsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/interests" }.should route_to(:controller => "interests", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/interests/new" }.should route_to(:controller => "interests", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/interests/1" }.should route_to(:controller => "interests", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/interests/1/edit" }.should route_to(:controller => "interests", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/interests" }.should route_to(:controller => "interests", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/interests/1" }.should route_to(:controller => "interests", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/interests/1" }.should route_to(:controller => "interests", :action => "destroy", :id => "1") 
    end
  end
end
