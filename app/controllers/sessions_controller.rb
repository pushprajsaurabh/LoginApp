class SessionsController < ApplicationController
before_filter :user_authenticate , :only => [:home]

def home
#Redirects to home.html.erb
end

def list_allusers
#List all the users registered on the app
	@all_users = User.all
end


def login
	authorized_user = User.authenticate(params[:username],params[:login_password])
		if authorized_user
			session[:user_id] = authorized_user.id
			flash[:notice] = "Welcome again #{authorized_user.name}, you are logged in as #{authorized_user.username}"
			redirect_to(:action => 'home')
		elsif (authorized_user == false and params[:username].nil?)
			flash[:notice] = "Please enter your login credentials"
		else
			flash[:notice] = "Invalid Username or Password"
        	flash[:color]= "invalid"
			render "login"	
		end
end

def logout
	session[:user_id] = nil
	redirect_to(:action => "login")
end

end