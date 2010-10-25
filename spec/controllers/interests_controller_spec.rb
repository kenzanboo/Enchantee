require 'spec_helper'

describe InterestsController do

  def mock_interest(stubs={})
    @mock_interest ||= mock_model(Interest, stubs)
  end

  describe "GET index" do
    it "assigns all interests as @interests" do
      Interest.stub(:find).with(:all).and_return([mock_interest])
      get :index
      assigns[:interests].should == [mock_interest]
    end
  end

  describe "GET show" do
    it "assigns the requested interest as @interest" do
      Interest.stub(:find).with("37").and_return(mock_interest)
      get :show, :id => "37"
      assigns[:interest].should equal(mock_interest)
    end
  end

  describe "GET new" do
    it "assigns a new interest as @interest" do
      Interest.stub(:new).and_return(mock_interest)
      get :new
      assigns[:interest].should equal(mock_interest)
    end
  end

  describe "GET edit" do
    it "assigns the requested interest as @interest" do
      Interest.stub(:find).with("37").and_return(mock_interest)
      get :edit, :id => "37"
      assigns[:interest].should equal(mock_interest)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created interest as @interest" do
        Interest.stub(:new).with({'these' => 'params'}).and_return(mock_interest(:save => true))
        post :create, :interest => {:these => 'params'}
        assigns[:interest].should equal(mock_interest)
      end

      it "redirects to the created interest" do
        Interest.stub(:new).and_return(mock_interest(:save => true))
        post :create, :interest => {}
        response.should redirect_to(interest_url(mock_interest))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved interest as @interest" do
        Interest.stub(:new).with({'these' => 'params'}).and_return(mock_interest(:save => false))
        post :create, :interest => {:these => 'params'}
        assigns[:interest].should equal(mock_interest)
      end

      it "re-renders the 'new' template" do
        Interest.stub(:new).and_return(mock_interest(:save => false))
        post :create, :interest => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested interest" do
        Interest.should_receive(:find).with("37").and_return(mock_interest)
        mock_interest.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :interest => {:these => 'params'}
      end

      it "assigns the requested interest as @interest" do
        Interest.stub(:find).and_return(mock_interest(:update_attributes => true))
        put :update, :id => "1"
        assigns[:interest].should equal(mock_interest)
      end

      it "redirects to the interest" do
        Interest.stub(:find).and_return(mock_interest(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(interest_url(mock_interest))
      end
    end

    describe "with invalid params" do
      it "updates the requested interest" do
        Interest.should_receive(:find).with("37").and_return(mock_interest)
        mock_interest.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :interest => {:these => 'params'}
      end

      it "assigns the interest as @interest" do
        Interest.stub(:find).and_return(mock_interest(:update_attributes => false))
        put :update, :id => "1"
        assigns[:interest].should equal(mock_interest)
      end

      it "re-renders the 'edit' template" do
        Interest.stub(:find).and_return(mock_interest(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested interest" do
      Interest.should_receive(:find).with("37").and_return(mock_interest)
      mock_interest.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the interests list" do
      Interest.stub(:find).and_return(mock_interest(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(interests_url)
    end
  end

end
