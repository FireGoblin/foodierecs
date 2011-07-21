module ApplicationHelper
	
#	def logo
#		image_tag("bar.jpg", :alt => "foodierecs", :class => "round")
#	end
	
	# Return a title on a per-page basis
	def title
		base_title = "Restaraunt recommendations from Foodies - foodierecs"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
end
