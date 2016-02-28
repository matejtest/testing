class Api::V1::UsersController < Api::V1::ApplicationController

	skip_before_action :authenticate_user, :only => :create
	#before_action :set_cors, :only => [:create, :loggedin_user]

	def create
		@user = User.new(user_params)

		if @user.save
			render 'create.json.jbuilder', :status => 201
		else
			render :json => { :message => @user.errors.full_messages.to_sentence }, :status => 409
		end
	end

	def update
		@user = User.find(params[:id])
		authorize @user

		if @user.update_attributes(user_params)
			render 'update.json.jbuilder', :status => 200
		else
			render :json => { :message => @user.errors.full_messages.to_sentence }, :status => 409
		end
	end

	def destroy
		@user = User.find(params[:id])
		authorize @user

		if @user.destroy
			render :json => { :message => "User deleted"}, :status => 200
		else
			render :json => { :message => @user.errors.full_messages.to_sentence }, :status => 409
		end
	end

	def show
		@user = User.find(params[:id])
		authorize @user
		render 'show.json.jbuilder', :status => 200
	end

	def index
		@users = User.all
		authorize @users
		render 'index.json.jbuilder', :status => 200
	end

	def report
		@user = User.find(params[:id])
		authorize @user

		data = ReportService.generate_report_data(params, @user)

		if data.nil?
			render :json => { :message => "Wrong params"}, :status => 400
		else
			if request.headers['Accept'] && (request.headers['Accept'] == 'application/pdf' || request.headers['Accept'] == 'application/octet-stream')
				send_data ReportService.generate_pdf(data), filename: APP_CONFIG['report_file_name'], type: 'application/pdf', :status => 200
			else
				send_data data, filename: APP_CONFIG['report_file_name'], type: 'json', :status => 200
			end
		end
	end

	def loggedin_user
		@user = User.find_by_api_token(request.headers["api-token"])
		authorize @user

		render 'loggedin_user.json.jbuilder', :status => 200
	end


	private

	# def set_cors
	# 	response.headers["Access-Control-Allow-Origin"] = "*"
	# 	# response.headers["Access-Control-Request-Method"] = "*"
	# end

	def user_params
		params.permit(*policy(User).user_attributes)
	end

end
