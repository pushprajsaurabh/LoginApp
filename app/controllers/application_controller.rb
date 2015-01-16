class ApplicationController < ActionController::Base
  protect_from_forgery
  def user_authenticate
  	unless session[:user_id]
  		redirect_to(:controller => "sessions" , :action => "login")
  		return false
  	else
  		@current_user = User.find(session[:user_id])
  		return true
  	end
  end

end
