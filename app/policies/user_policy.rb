class UserPolicy < ApplicationPolicy

	class Scope < Scope
		def resolve
			scope
		end
	end

	def index?
		is_admin?
	end

	def show?
		is_admin? || is_profile_owner?
	end

	def user_details?
		is_admin?
	end

	def create?
		is_admin?
	end

	def update?
		is_admin? || is_profile_owner?
	end

	def destroy?
		is_admin?
	end

	def filter_expenses?
		is_admin? || is_profile_owner?
	end

	def report?
		is_admin? || is_profile_owner?
	end

	def logout?
		user && user.id == record.id
	end

	def loggedin_user?
		user && user.id == record.id
	end

	def can_manage_expenses?
		is_admin? || is_profile_owner?
	end

	def user_attributes
		if user.present? && user.role.name == "admin"
			[:first_name, :last_name, :password, :password_confirmation, :email, :role_id]
		else
			[:first_name, :last_name, :password, :password_confirmation, :email]
		end
	end


	private

	def is_profile_owner?
		user.present? && user.id == record.id
	end

end
