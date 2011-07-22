class Opinion < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant
	
	default_scope :order => 'opinions.created_at DESC'
end
