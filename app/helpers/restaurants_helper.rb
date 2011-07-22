module RestaurantsHelper
	
	def formatName(name)
		return name.squeeze(" ").downcase.tr("(),?!':.[]", "").gsub(" ", "-")
	end
end
