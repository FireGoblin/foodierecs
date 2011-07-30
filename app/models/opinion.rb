class Opinion < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant
	
	default_scope :order => 'opinions.created_at DESC'
	
	def self.create_from_hash!(hash)
	  if Opinion.where( :user_id => hash['user_id'], :restaurant_id => hash['restaurant_id'] ) == []
  	  create(:user_id => hash['user_id'], :restaurant_id => hash['restaurant_id'], :like => hash['like'], :foodie => hash['foodie'], :to_eat => "", :to_drink => "")
	  end
	end
end
