class User < ActiveRecord::Base
	has_friendly_id :facebook_url, :use_slug => true
end
