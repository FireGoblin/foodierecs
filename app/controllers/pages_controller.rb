class PagesController < ApplicationController
	include PagesHelper
	
	def home
	end
	
	def index
	end
	
	def main
	  if( session[ :user ].nil? )
	    redirect_to "/"
    else
    
	  	@recommended = restaurantRecommendations( session[ :user ] )
  		@recently_rated = recentlyRated
  		@places_to_rate = placesToRate( session[ :user ] )
  		
  		@recently_rated = @recently_rated - @reccomended
  		
  		recommended_restaurants = Array.new
  		@recommended.each do |i|
  			recommended_restaurants[recommended-restaurants.count] = i.restaurant
  		end
  		
  	  rated_restaurants = Array.new
  	  @recently_rated.each do |i|
  	  	rated_restauarants[rated_restaurants.count] = i.restaurant
  	  end
  	  
  	  @places_to_rate = @places_to_rate - recommended_restaurants - rated_restaurants
  		
  		
  		@recommended = @recommended.paginate(:page => params[:page], :per_page => 5)
  		@recently_rated = @recently_rated.paginate(:page => params[:page], :per_page => 5)
  		@places_to_rate = @places_to_rate.paginate(:page => params[:page], :per_page => 9)
	  end
	end
	
	def becomeafoodie
	end
	
	def recommendations
	  @recommended = restaurantRecommendations(current_user)
  end
	
end