class SessionsController < ApplicationController
  def new
	end

	def create
		user = User.authenticate(params[:email], params[:password])
		if user
			session[:user_id] = user.id
			redirect_to admin_url, flash: { success: "Log in successful! Welcome #{user.name}!" }
		else
			flash.now['danger'] = "Invalid email or password"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, flash: { info: "Logout successful. #{view_context.link_to("Log in again?", log_in_path)}" }
	end
end
