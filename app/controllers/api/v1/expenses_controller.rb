class Api::V1::ExpensesController < Api::V1::ApplicationController

	before_action :find_parent
	before_action :find_record, :except => [:create, :index, :filter]

	def create
		@expense = Expense.new(expense_params)
		authorize @expense

		if @expense.save
			render 'create.json.jbuilder', :status => 201
		else
			render :json => { :message => @expense.errors.full_messages.to_sentence }, :status => 409
		end
	end

	def update
		if @expense.update_attributes(expense_params)
			render 'update.json.jbuilder', :status => 200
		else
			render :json => { :message => @expense.errors.full_messages.to_sentence }, :status => 409
		end
	end

	def destroy
		if @expense.destroy
			render :json => { :message => "Expense deleted." }, :status => 200
		else
			render :json => { :message => @expense.errors.full_messages.to_sentence }, :status => 409
		end
	end

	def show
		render 'show.json.jbuilder', :status => 200
	end

	def index
		@expenses = @user.expenses
		render 'index.json.jbuilder', :status => 200
	end

	def filter
		@filter_result = ExpensesFilterService.get_filter_results(params[:type], @user)

		if !@filter_result.nil?
			render 'filter.json.jbuilder', :status => 200
		else
			render :status => 204
		end
	end


	private

	def find_record
		@expense = Expense.find(params[:id])
		authorize @expense
	end

	def find_parent
		@user = User.find(params[:user_id])
		authorize @user, :can_manage_expenses?
	end

	def expense_params
		params.permit(*policy(Expense).expense_attributes)
	end

end
