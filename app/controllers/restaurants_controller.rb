class RestaurantsController < ApplicationController
	before_filter :admin_user,  :only => [:index, :edit, :update, :destroy]
	
  # GET /restaurants
  # GET /restaurants.xml
  def index
    @restaurants = Restaurant.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @restaurants }
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.xml
  def show
    @restaurant = Restaurant.find(params[:id])
    @user = nil
    @opinions = @restaurant.opinions.paginate(:page => params[:page], :per_page => 6)
    @title = @restaurant.name

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @restaurant }
    end
  end

  # GET /restaurants/new
  # GET /restaurants/new.xml
  def new
    @restaurant = Restaurant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @restaurant }
    end
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # POST /restaurants
  # POST /restaurants.xml
  def create
    @restaurant = Restaurant.new(params[:restaurant])

		puts(@restaurant.name + " " + @restaurant.formatted_name)
		@restaurant.formatted_name = formatName(@restaurant.name)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to(@restaurant, :notice => 'Restaurant was successfully created.') }
        format.xml  { render :xml => @restaurant, :status => :created, :location => @restaurant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @restaurant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /restaurants/1
  # PUT /restaurants/1.xml
  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to(@restaurant, :notice => 'Restaurant was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @restaurant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.xml
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to(restaurants_url) }
      format.xml  { head :ok }
    end
  end
  
  def findId
    puts "\n\nprinting session info"
    session.each do |key, value|
      puts "#{key.to_s} #{value.to_s}"
    end
    request.cookies.each do |key, value| 
      puts "#{key.to_s} #{value.to_s}" 
    end
    
    @restaurant = Restaurant.find( params[ :formatted_name ] )
    
    #puts "\n\n\n" + @restaurant.id + "\n\n\n"
    
    render :text => @restaurant.id
  end
  
  def search
    results = Restaurant.where( "name LIKE ?", "#{params[ :query ]}%" );
    toRender = "Search Results: " + results.count.to_s
    counter = 0
    
    results.each do |r|
      toRender = toRender + "<div><a href=\""+url_for( r )+"\">"+r.name+ "</a></div>";
      counter = counter + 1
      if counter >= 10
        break
      end
    end
    
    render :text => toRender
  end
  
   private
  
  	def admin_user
  		redirect_to(root_path) unless User.find_by_id(session[:user_id]).admin?
  	end
end
