class Api::V1::SessionsController < Api::V1::ApplicationController

	skip_before_action :authenticate_user, :only => :create
	before_action :set_cors, :only => :create

	def create

		@user = User.find_by_email(params[:email].downcase) if params[:email].present?

		if @user && @user.authenticate(params[:password])
			render 'create.json.jbuilder', :status => 201
		else
			render :json => { :message => 'Please check your credentials.'}, :status => 401
		end
	end

	def destroy

		user = User.find(params[:id])

		if user
			authorize user, :logout?
			user.reset_api_token
			user.save
			render :json => { :message => 'Session deleted.'}, :success => true, :status => 200
		else
			render :json => { :message => 'Not found'}, :status => 404
		end

	end

	private

	def set_cors
		response.headers["Access-Control-Allow-Origin"] = "*"
		# response.headers["Access-Control-Allow-Methods"] = "OPTIONS, POST, DELETE, PUT"
		# response.headers["Access-Control-Allow-Headers"] = "*"
		# response.headers["Access-Control-Request-Method"] = "*"
	end

end
