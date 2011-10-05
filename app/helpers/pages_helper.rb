module PagesHelper
	def restaurantRecommendations(user_id)
		threshold = 1
		commonality = 0
		the_restaurants = Array.new
		user = User.find_by_id(user_id)
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
					the_restaurants[the_restaurants.count] = i.restaurant
				end
				commonality = 0
			end
		end
		
		the_restaurants = the_restaurants.uniq
		if( the_restaurants.count < 100 )
		  Opinion.all.each do |i|
	      if( i.user != user && i.foodie && i.like > 0 && !( the_restaurants.include? i.restaurant ) )
          the_restaurants[ the_restaurants.count ] = i.restaurant
        end
        if( the_restaurants.count > 100 )
          break
        end
	    end
    end
    
    the_opinions = Array.new
		the_restaurants.each do |i|
	    opinions_arr = i.opinions.where( :like => 1, :foodie => true )
	    opinions_arr.shuffle
	    the_opinions[ the_opinions.count ] = opinions_arr[0]
	  end
		
		puts("\n\n\n#{the_restaurants.count}\n\n\n")
		return the_opinions
	end
	
	def placesToRate(user_id)
	  puts "\n\nbeginning of places to rate\n\n"
		the_restaurants = Array.new
		user = User.find_by_id(user_id)
		users_opinions = user.opinions
		#raw_arr = Restaurant.order( "rateable DESC" )		
		#raw_arr = Restaurant.where( "rating > ? OR rateable > 2", "4.0" )
    raw_arr_five = Restaurant.where( "rateable = 5" );
    raw_arr_four = Restaurant.where( "rateable = 4" );
    raw_arr_three = Restaurant.where( "rateable = 3" );
    raw_arr_rest = Restaurant.where( "rating > 3.5 AND rateable < 3" );

    #now we put together the final array
    raw_arr_five.shuffle.each do |res|
      if ( res.opinions.where( :user_id => user.id ) == [] )
	      the_restaurants[ the_restaurants.count ] = res
      end
      if( the_restaurants.count > 50 )
        break
      end
    end
    raw_arr_four.shuffle.each do |res|
      if ( res.opinions.where( :user_id => user.id ) == [] )
	      the_restaurants[ the_restaurants.count ] = res
      end
      if( the_restaurants.count > 75 )
        break
      end
    end
    raw_arr_three.shuffle.each do |res|
      if ( res.opinions.where( :user_id => user.id ) == [] )
	      the_restaurants[ the_restaurants.count ] = res
      end
      if( the_restaurants.count > 90 )
        break
      end
    end
    raw_arr_rest.shuffle.each do |res|
      if ( res.opinions.where( :user_id => user.id ) == [] )
	      the_restaurants[ the_restaurants.count ] = res
      end
      if( the_restaurants.count > 100 )
        break
      end
    end
		
		puts("\n\n\n#{the_restaurants.count}\n\n\n")
		return the_restaurants
	end
	
	def recentlyRated
		the_opinions = Opinion.where(:like => 1).order( ).limit(9)

		#the_restaurants = Array.new
		
		#the_opinions.each do |i|
		#	the_restaurants[the_restaurants.count] = Restaurant.find(i.restaurant_id)
		#end
		puts("\n\n\n#{the_opinions.count}\n\n\n")
		return the_opinions
	end
end