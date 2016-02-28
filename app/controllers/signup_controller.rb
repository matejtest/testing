class SignupController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(signup_params)

		if @user.save
			flash[:notice] = "Congratulations, you've created your account successfully!"
			redirect_to new_session_path
		else
			flash.now[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
			render "new"
		end
	end

	private

	def signup_params
		params.permit(*policy(User).user_attributes)
	end


end
