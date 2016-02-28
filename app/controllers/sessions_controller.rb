class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create

		if !SessionService.login_params_valid?(params)
			flash.now[:alert] = "Error: check your credentials."
			render :new and return
		end

		user = User.find_by_email(params[:email].downcase)

		if user.present?
			if user.authenticate(params[:password])
				cookies[:auth_token] = user.auth_token
				flash.now[:notice] = "You have successfully logged in."
				redirect_to user_path(user.id) and return
			else
				flash.now[:error] = 'Error: check your password.'
				render :new and return
			end
		else
			flash.now[:error] = 'Error: check your email.'
			render :new and return
		end

	end

	def destroy
		cookies.delete(:auth_token)
		reset_session
		redirect_to root_path, :notice => 'You have been logged out.'
	end
end
