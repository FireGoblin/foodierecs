class UsersController < ApplicationController
	before_filter :admin_user,  :only => [:index, :edit, :update, :destroy]
	
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
    @restaurant = nil
    @opinions = @user.opinions.paginate(:page => params[:page], :per_page => 20)
    @saved_places = @user.saved_places
    @title = @user.username
		
    #redirect_to "users/#{@user.[:facebook_url]}"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  # GET /users/username
  # GET /users/username.xml
  def exists
    @user = User.where( "username = ?", params[:username] )
    
    if !@user.empty?
      render :text => @user.first.id
    else
      render :text => "NO"
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
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
    
    @user.admin = false

    respond_to do |format|
      if @user.save
        render :text => @user.id
        #format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        #format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end


  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

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
  
  private
  
  	def admin_user
  		redirect_to(root_path) unless User.find_by_id(session[:user_id]).admin?
  	end
end
