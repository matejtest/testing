class FilterPolicy < ApplicationPolicy

	class Scope < Scope
		def resolve
			scope
		end
	end

	def index?
		user.present?
	end

end
