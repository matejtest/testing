class ExpensePolicy < ApplicationPolicy

	class Scope < Scope
		def resolve
			scope
		end
	end

	def create?
		can_manage_expense?
	end

	def show?
		can_manage_expense?
	end

	def edit?
		can_manage_expense?
	end

	def update?
		can_manage_expense?
	end

	def destroy?
		can_manage_expense?
	end

	def expense_attributes
		[:description, :amount, :date, :time, :comment, :user_id]
	end

	def can_manage_expense?
		is_admin? || (user.present? && record.user_id == user.id)
	end


end
