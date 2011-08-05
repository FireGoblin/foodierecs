class SessionsController < ApplicationController
  
  def create
		auth = request.env['omniauth.auth']
  	if @auth = Authorization.find_from_hash(auth)
  		# Log the authorizing user in.
  		self.current_user = @auth.user
  		puts("\n\n#{self.current_user}\n\n")
      session[ :user ] = @auth.user
  		redirect_to '/main'
		else
  		# Create a new user or add an auth to existing user, depending on
    	# whether there is already a user signed in.
    	@auth = Authorization.create_from_hash(auth, current_user)
    	self.current_user = @auth.user
    	redirect_to '/becomeafoodie'
		end
	end
	
	def new
    @user = User.find(params[:id])
    if( !@user.nil? )
      session[ :user ] = @user
      session[ :user_id ] = @user.id
    end
    redirect_to '/main'
  end

end
