f = File.new("restaurants.txt", "w")

restaurant = Array.new

Restaurant.all.each do |i|
	restaurant[restaurant.count] = i
end

 restaurant = restaurant.sort_by &:formatted_name

last_name = ""
index = 1

restaurant.each do |x|
	if(x["formatted_name"] == last_name)
		index += 1
	else
		index = 1
	end

	if(index == 1)
		f.write("http://foodierecs.com/restaurants/#{x["formatted_name"]}\n")
	else
		f.write("http://foodierecs.com/restaurants/#{x["formatted_name"]}--#{index}\n")
	end

	last_name = x["formatted_name"]
end

f.close






