class PagesController < ApplicationController
	include PagesHelper
	
	def home
	end
	
	def index
	end
	
	def main
		@recommended = restaurantRecommendations(User.find(7))
		@recommended = @recommended.paginate(:page => params[:page])
		@places_to_rate = placesToRate(User.find(7))
		@places_to_rate = @places_to_rate.paginate(:page => params[:page])
		@recently_rated = recentlyRated
		@recently_rated = @recently_rated.paginate(:page => params[:page])
	end
	
	def becomeafoodie
	end
	
end