module PagesHelper
	
	def restaurantRecommendations(user)
		threshold = 1
		commonality = 0
		the_restaurants = Array.new
		users_opinions = user.opinions
		Opinion.all.each do |i|
			if(i.user != user && i.foodie && i.like > 0 && users_opinions.where(:restaurant_id => i.restaurant_id) == [])
				the_foodie = i.user
				the_foodie_opinions = the_foodie.opinions
				the_foodie_opinions.each do |x|
					users_opinions.each do |y|
						if(y.restaurant == x.restaurant && y.like > 0 && x.like > 0)
							commonality += 1;
						end
					end
				end
				if(commonality >= threshold)
					the_restaurants[the_restaurants.count] = i
				end
				commonality = 0
			end
		end
		
		puts("\n\n\n#{the_restaurants.count}\n\n\n")
		return the_restaurants
	end
	
	def placesToRate(user)
		the_restaurants = Array.new
		users_opinions = user.opinions
		Opinion.all.each do |i|
			if(i.user_id != user.id && users_opinions.where(:restaurant_id => i.restaurant_id) == [])
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