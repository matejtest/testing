class Api::V1::ApplicationController < ApplicationController

	#force_ssl
	protect_from_forgery with: :null_session

	before_action :authenticate_user, :destroy_session

	def current_user
		if @current_user
			@current_user
		elsif request.headers["api-token"]
			@current_user = User.find_by_api_token(request.headers["api-token"])
		end
	end

	def authenticate_user
		if request.headers["api-token"] && request.headers["email"]

			user = User.find_by_email(request.headers["email"].downcase)

			if user && ActiveSupport::SecurityUtils.secure_compare(user.api_token, request.headers["api-token"])
				@current_user = user
			else
				return unauthenticated!
			end
		else
			return unauthenticated!
		end
	end

	#disabling CSRF token and cookies => API's are stateless, and session is opposite of that
	def destroy_session
		request.session_options[:skip] = true
	end

	def unauthenticated!
		response.headers['WWW-Authenticate'] = "Token realm=Application"
		render :json => { :error => 'Bad credentials' }, status: 401
	end

	def user_not_authorized
		render :json => { :error => "Access denied" }, :status => 403
	end

	def record_not_found
		render :json => { :error => "Not found" }, :status => 404
	end

end