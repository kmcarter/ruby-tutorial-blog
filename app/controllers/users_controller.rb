class UsersController < ApplicationController
  def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_url, success: "Thanks for registering, #{@user.name}! You're all set!"
		else
			render "new"
		end
	end
	
	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
