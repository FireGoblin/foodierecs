class SavedPlaces < ActiveRecord::Base
  belongs_to :user
	belongs_to :restaurant
	
	default_scope :order => 'saved_places.created_at DESC'
	
	def self.create_from_hash!(hash)
	  if SavedPlaces.where( :user_id => hash['user_id'], :restaurant_id => hash['restaurant_id'] ) == []
  	  create(:user_id => hash['user_id'], :restaurant_id => hash['restaurant_id'], :foodie => hash['foodie'] )
	  end
	end
end
