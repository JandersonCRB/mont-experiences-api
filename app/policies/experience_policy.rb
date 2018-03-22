class ExperiencePolicy < ApplicationPolicy
	def index?
		return true
	end

	def create?
		return user.admin
	end

	def update?
		return user.admin
	end

	def show?
		return true
	end

	def destroy?
		return user.admin
	end
end