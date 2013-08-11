# Handles creating new sessions (loging in) and destroying sessions (logging out)
class SessionsController < ApplicationController

	def create 
		user = User.authenticate(params[:email], params[:password]);

		if user
			session[:user_id] = user.id
			redirect_to dashboard_path
		else
			flash.now[:alert] = 'Could not log you in.  Please check your username and/or password.'
			redirect_to root_url
		end
	end


	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => 'Logged out!'
	end

end