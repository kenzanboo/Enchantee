class UsersController < ApplicationController
  before_filter :require_user, :only => [:edit, :edit_interests, :show, :show_interests]
  
  def update_location
    @user = User.all
    
    respond_to do |format|
      format.html # update_location.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    @interests=@user.interests

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html { render :layout => 'misc' } # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    @interests=@user.interests
    

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  def add_interest
    @interest = Interest.new
    @user = User.find(params[:user_id])
    @categories = Category.all
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def interests
    @user = User.find(params[:user_id])
    @interests = @user.interests.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def edit_interests
    @interest = Interest.find(params[:interest_id])
    @user = User.find(params[:user_id])
  end
  
  def create_interest
    @interest = Interest.new(params[:interest])
    @user = User.find(params[:user_id])
    
    respond_to do |format|
      if @interest.save
        @user.interests<<@interest
        format.html { redirect_to(user_interests(@user), :notice => 'Interest was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @interest }
      else
        format.html { render :action => "interests" }
        format.xml  { render :xml => @interest.errors, :status => :unprocessable_entity }
      end
    end
  end
end
