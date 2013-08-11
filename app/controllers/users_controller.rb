class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def index

	end

	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to root_url, :notice => 'Your account was created! Log in using the form above'
		else
			render 'new'
		end
	end

end