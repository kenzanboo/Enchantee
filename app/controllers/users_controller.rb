class UsersController < ApplicationController
  before_filter :require_user, :except => [:new, :create]
  before_filter :require_no_user, :only => [:new, :create]
  
  def update_location
    if not params[:latitude].to_s.empty? and not params[:longitude].to_s.empty?
      current_user.latitude, current_user.longitude = params[:latitude], params[:longitude]
      current_user.save
    elsif params[:address] and not params[:address].empty?
      location = Geokit::Geocoders::GoogleGeocoder.geocode(params[:address])
      if location.success
        current_user.latitude, current_user.longitude = location.lat, location.lng
        current_user.save
      end
    end
    redirect_to :controller => 'nearby', :action => 'list'
  end
  
  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    
    @interests = @user.interests
    
    unless @user.latitude and @user.longitude
      raise "User has no location"
    end
    
    @map = GMap.new("nearby_users")
    @marker = Marker.new(@user.latitude, 
                         @user.longitude, 
                         @user.name, 
                         @template.render(:partial => "nearby/user_short", :locals => {:user => @user}))
    @map.center = @marker
    @map.markers = [@marker]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  # GET /users/1
  # GET /users/1.xml
  def saved
    @user = current_user

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
    @user = current_user
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
        format.html { render :action => "new", :layout => 'misc' }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = current_user
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
=begin
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
=end
  
  def remove_interest
    @user=User.find(params[:user_id])
    @user.interests.delete(Interest.find(params[:id]))
  end
  
  def current_interest
    puts params[:category_id]
    int=Interest.find_or_create_by_name(params[:interest])
    if current_user.interests.member?(Interest.find(int.id))
      current_user.interests<<int
    end
    current_user.current_interest_id=int.id
    current_user.save
    render :partial => 'show_interest', :locals=>{:interest=>int}
  end
end
