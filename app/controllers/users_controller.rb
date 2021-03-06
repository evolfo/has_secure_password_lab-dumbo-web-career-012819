class UsersController < ApplicationController

	def index
		
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.valid?
			redirect_to users_path
			session[:user_id] = @user.id
		else
			redirect_to new_user_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end

end
