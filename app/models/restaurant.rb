class Restaurant < ActiveRecord::Base
	has_friendly_id :formatted_name, :use_slug => true
	has_many :opinions
	has_many :saved_places, :class_name => 'SavedPlaces'
end
