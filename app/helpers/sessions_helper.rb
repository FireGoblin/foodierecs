module SessionsHelper
	def sign_in(user)
  	#cookies.permanent.signed[:remember_token] = [user.id, user.salt]
  	self.current_user = user
  	puts("#{self.current_user.username}")
  end
  
  def current_user
  	puts("/n/n/n/n/n/n/n/n/n/n#{@current_user}/n/n/n/n")
  	return @current_user
  end
  
  def current_user=(user)
  	@current_user = user
  end
  
  def current_user?(user)
  	user == current_user
  end
  
  def sign_out
  	self.current_user = nil
  end
end
