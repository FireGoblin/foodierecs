def formatName(name)
	return name.squeeze(" ").downcase.tr("(),?!':.[]", "").gsub(" ", "-")
end

count = 0
Dir.foreach('../total') do |item|
	next if item == '.' || item == '..'
  count += 1
  next if count < 1200
  if(count % 100 == 0)
  	puts("#{count}")
	end
	puts(item)
  f = File.open("../total/" + item, "r")
  resp = f.read
  
  result = JSON.parse(resp)
  result_r = result["result"]
  
  formatted_name = formatName(result_r["name"])
  
  if(result_r["address_components"])
  	number = result_r["address_components"][0];
  	
  
  Restaurant.create!(:name => result_r["name"], :formatted_name => formatted_name, :address => result_r["formatted_address"], :street_number => result_r["address_components"][0]["short_name"], :street => result_r["address_components"][1]["short_name"], :phone => result_r["formatted_phone_number"], :lat => result_r["geometry"]["location"]["lat"], :long => result_r["geometry"]["location"]["lng"], :icon => result_r["icon"], :google_id => result_r["id"], :reference => result_r["reference"], :type1 => result_r["types"][0], :type2 => result_r["types"][1], :type3 => result_r["types"][2], :type4 => result_r["types"][3], :url => result_r["url"], :vicinity => result_r["vicinity"], :rating => result_r["rating"],
  :foodie_likes => 0, :foodie_dislikes => 0, :normal_likes => 0, :normal_dislikes => 0, :borough => result_r["address_components"][2]["short_name"])
  
	else
		
	Restaurant.create!(:name => result_r["name"], :formatted_name => formatted_name, :address => result_r["formatted_address"], :phone => result_r["formatted_phone_number"], :lat => result_r["geometry"]["location"]["lat"], :long => result_r["geometry"]["location"]["lng"], :icon => result_r["icon"], :google_id => result_r["id"], :reference => result_r["reference"], :type1 => result_r["types"][0], :type2 => result_r["types"][1], :type3 => result_r["types"][2], :type4 => result_r["types"][3], :url => result_r["url"], :vicinity => result_r["vicinity"], :rating => result_r["rating"],
  :foodie_likes => 0, :foodie_dislikes => 0, :normal_likes => 0, :normal_dislikes => 0)
	end
end