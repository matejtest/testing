class UsersController < ApplicationController

	before_filter :find_record, :except => :create

	def create
		@user = User.new(user_params)
		authorize @user

		@user.save

		respond_to do |format|
			format.js
		end
	end

	def show
		@user = User.find(params[:id])
		authorize @user
		@expenses = @user.expenses

		if current_user.role.name == "admin"
			@users = User.all
		end
	end

	def user_details
		respond_to do |format|
			format.js
		end
	end

	def edit
		respond_to do |format|
			format.js
		end
	end

	def update
		@user.update_attributes(user_params)
		respond_to do |format|
			format.js
		end
	end

	def destroy
		@user.destroy

		respond_to do |format|
			format.js
		end
	end



	def report
		data = ReportService.generate_report_data(params, @user)

		if data.nil?
			data << "Wrong date params."
		end

		send_data ReportService.generate_pdf(data), filename: APP_CONFIG['report_file_name'], type: 'application/pdf', :disposition => "attachment"
	end


	private

	def user_params
		params.permit(*policy(User).user_attributes)
	end

	def find_record
		@user = User.find(params[:id])
		authorize @user
	end

end
