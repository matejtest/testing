class ApplicationController < ActionController::Base

	include Pundit

	# Prevent CSRF attacks by raising an exception.
	protect_from_forgery with: :exception

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
	rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

	helper_method :current_user, :user_logged_in?

	def current_user
		@current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
	end

	def user_logged_in?
		!current_user.nil?
	end

	def record_not_found
		flash[:error] = "Error: record not found!"
		redirect_to user_path(current_user)
	end

	def user_not_authorized(exception)
		Rails.logger.info build_authorization_log(exception)
		flash[:error] = 'Access denied'
		redirect_to root_path
	end

	def build_authorization_log(exception)
  		policy_name = exception.policy.class.to_s.underscore
  		message = "Authorization Error! pundit.#{policy_name}.#{exception.query} from ip address #{request.remote_ip}"
  		message += " by user #{current_user}" if current_user
  		message
  	end

end
