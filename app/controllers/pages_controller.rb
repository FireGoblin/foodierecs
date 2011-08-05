class PagesController < ApplicationController
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
  		@recommended = @recommended.paginate(:page => params[:page], :per_page => 5)
  		@places_to_rate = placesToRate( session[ :user_id ] )
  		@places_to_rate = @places_to_rate.paginate(:page => params[:page], :per_page => 9)
  		@recently_rated = recentlyRated
  		@recently_rated = @recently_rated.paginate(:page => params[:page], :per_page => 5)
	  end
	end
	
	def becomeafoodie
	end
	
	def recommendations
	  @recommended = restaurantRecommendations( session[ :user_id ] )
  end
	
end