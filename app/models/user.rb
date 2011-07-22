class User < ActiveRecord::Base
	has_friendly_id :username, :use_slug => true
	has_many :opinions
end
