class User < ActiveRecord::Base
	has_friendly_id :username, :use_slug => true
	has_many :opinions
	has_many :authorizations
	
	def self.create_from_hash!(hash)
  	create(:first_name => hash['user_info']['first_name'], :last_name => hash['user_info']['last_name'], :facebook_url => hash['user_info']['urls']['Facebook'], :foodie => false, :email => hash['user_info']['email'], :username => hash['user_info']['nickname'], :gender => hash['extra']['user_hash']['gender'])
	end
end
