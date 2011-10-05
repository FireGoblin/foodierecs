class OpinionsController < ApplicationController
	before_filter :admin_user,  :only => [:index, :edit, :update, :destroy]
	
  # GET /opinions
  # GET /opinions.xml
  def index
    @opinions = Opinion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @opinions }
    end
  end

  # GET /opinions/1
  # GET /opinions/1.xml
  def show
    @opinion = Opinion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @opinion }
    end
  end

  # GET /opinions/new
  # GET /opinions/new.xml
  def new
    @opinion = Opinion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @opinion }
    end
  end

  # GET /opinions/1/edit
  def edit
    @opinion = Opinion.find(params[:id])
  end

  # POST /opinions
  # POST /opinions.xml
  def create
    @opinion = Opinion.new(params[:opinion])
    
    #Let's see if there's already such an opinoin, if there is, we remove it
    Opinion.destroy_all( :user_id => @opinion.user_id, :restaurant_id => @opinion.restaurant_id );
    
    if @opinion.save
=begin
      #we need to update the restaurant table
      rest = Restaurant.where( :id => @opinion.restaurant_id ).first
      puts "\n\n\nrestaurant id is #{rest.id}\n\n\n"
      if @opinion.user_id
        if @opinion.like == 1
          rest.foodie_likes += 1
        else
          rest.foodie_dislikes += 1
        end
      else
        if @opinion.like == 1
          rest.nonfoodie_likes += 1
        else
          rest.nonfoodie_dislikes += 1
        end
      end
      rest.save   
=end
      
      #not sure how efficient this is, but I'm going to recount the likes and not likes for restaurants
      rest = Restaurant.where( :id => @opinion.restaurant_id ).first
      likes = rest.opinions.where( :like => 1, :foodie => true )
      dislikes = rest.opinions.where( :like => -1, :foodie => true )
      rest.foodie_likes = likes.count
      rest.foodie_dislikes = dislikes.count
      rest.save
      
      if @opinion.like == 1
        #if it was a like, we should redirect to the page of the restaurant
        redirect_to restaurant_path( @opinion.restaurant )
      else
        render :text => "OK"
      end
      
    else
      render :text => "FAIL"
    end
    #respond_to do |format|
    #  if @opinion.save
    #    render :text => "OK"
    #  else
    #    render :text => "FAIL"
    #  end
    #end
  end

  # PUT /opinions/1
  # PUT /opinions/1.xml
  def update
    @opinion = Opinion.find(params[:id])

    respond_to do |format|
      if @opinion.update_attributes(params[:opinion])
        format.html { redirect_to(@opinion, :notice => 'Opinion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @opinion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.xml
  def destroy
    puts "\n\n\n IN OPINION DESTROY \n\n\n"
    @opinion = Opinion.find(params[:id])
    @opinion.destroy

    render :text => "OK"
    #respond_to do |format|
    #  render :text => "OK"
    #end
  end
  
  def deleteid
    @restaurant = Restaurant.find( params[ :formatted_name ] )
    @opinion = Opinion.where( :restaurant_id => @restaurant.id, :user_id => params[ :user_id ] ).first;
    @opinion.destroy
    
    render :text => "OK"
  end
  
   private
  
  	def admin_user
  		redirect_to(root_path) unless User.find_by_id(session[:user_id]).admin?
  	end
end
