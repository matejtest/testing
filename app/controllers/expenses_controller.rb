class ExpensesController < ApplicationController

	before_filter :find_parent
	before_filter :find_record, :except => [:create, :filter]

	def show
		respond_to do |format|
			format.js
		end
	end

	def create
		@expense = Expense.new(expense_params)
		@expense.user_id = @user.id
		authorize @expense
		@expense.save

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
		@expense.update_attributes(expense_params)
		respond_to do |format|
			format.js
		end
	end

	def destroy
		@expense.destroy

		respond_to do |format|
			format.js
		end
	end

	def filter
		@filter_result = ExpensesFilterService.get_filter_results(params[:filter_id], @user)

		respond_to do |format|
			format.js
		end
	end

	private

	def find_parent
		@user = User.find(params[:user_id])
		authorize @user, :can_manage_expenses?
	end

	def find_record
		@expense = Expense.find(params[:id])
		authorize @expense
	end

	def expense_params
		params.permit(*policy(Expense).expense_attributes)
	end

end
