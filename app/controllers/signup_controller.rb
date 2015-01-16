class SignupController < ApplicationController

def newuser
	   @user = User.new(params[:user])
    	if @user.save
    	flash[:notice] = "You Signed up successfully"
        flash[:color]= "valid"
      else
        flash[:notice] = "Kindly enter you details as suggested by the bottom panel"
        flash[:color]= "invalid"
      end
     render "new"
  end

end