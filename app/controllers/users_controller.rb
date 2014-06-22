class UsersController < ApplicationController

	def new
		@user = User.new #IS THIS "USER" from models?
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, notice: "Thank you for signing up."
		else
			render "new" #What does NEW actually render?
		end
	end

	private
		def user_params
			params.require(:user).permit(:email, :name, :password, :password_confirmation)
		end

end
