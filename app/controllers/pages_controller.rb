class PagesController < ApplicationController
	before_filter :admin_user,  :only => [:index, :edit, :update, :destroy]
	
	include PagesHelper
	
	def home
	end
	
	def index
	end
	
	def main
	  if( session[ :user_id ].nil? )
	    redirect_to "/"
    else
  
	  	@recommended = restaurantRecommendations( session[ :user_id ] )
  		@recently_rated = recentlyRated
  		@places_to_rate = placesToRate( session[ :user_id ] )
  		
  		if(@recently_rated && @recommended)
  			@recently_rated = @recently_rated - @recommended
  		end
  		
  		if(@recommended)
  			recommended_restaurants = Array.new
  			@recommended.each do |i|
  				recommended_restaurants[recommended_restaurants.count] = i.restaurant
  			end
  		end
  		
  		if(@recently_rated)
  	  	rated_restaurants = Array.new
  	  	@recently_rated.each do |i|
  	  		rated_restaurants[rated_restaurants.count] = i.restaurant
  	  	end
  	  end
  	  
  	  
  	  if(@places_to_rate)
  	  	@places_to_rate = @places_to_rate - recommended_restaurants - rated_restaurants
  		end
  		
  		@recommended = @recommended.paginate(:page => params[:page], :per_page => 5)
  		@recently_rated = @recently_rated.paginate(:page => params[:page], :per_page => 5)
  		@places_to_rate = @places_to_rate.paginate(:page => params[:page], :per_page => 9)
	  end
	end
	
	def becomeafoodie
	end
	
	def recommendations
    if( session[ :user_id ].nil? )
      redirect_to "/"
    else
	    @recommended = restaurantRecommendations( session[ :user_id ] )
    end
  end
	
end