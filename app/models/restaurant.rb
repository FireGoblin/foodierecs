class Restaurant < ActiveRecord::Base
	has_friendly_id :formatted_name, :use_slug => true
end
