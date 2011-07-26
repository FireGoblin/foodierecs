class SessionsController < ApplicationController
  def new
  end

  def destroy
  	sign_out
  end
end
