module PagesHelper
	
	def restaurantRecommendations(user)
		the_restaurants = Array.new
		Opinion.all.each do |i|
			if(i.user_id != user.id && i.foodie && i.like > 0)
				the_restaurants[the_restaurants.count] = i
			end
		end
		
		puts("\n\n\n#{the_restaurants.count}\n\n\n")
		return the_restaurants
	end
	
	def placesToRate(user)
		the_restaurants = Array.new
		Opinion.all.each do |i|
			if(i.user_id != user.id && i.like > 0)
				the_restaurants[the_restaurants.count] = i
			end
		end
		
		puts("\n\n\n#{the_restaurants.count}\n\n\n")
		return the_restaurants
	end
	
	def recentlyRated
		the_opinions = Opinion.find(:all, :order => "id desc", :limit => 5).reverse
		#the_restaurants = Array.new
		
		#the_opinions.each do |i|
		#	the_restaurants[the_restaurants.count] = Restaurant.find(i.restaurant_id)
		#end
		puts("\n\n\n#{the_opinions.count}\n\n\n")
		return the_opinions
	end
end