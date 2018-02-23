class ExperiencePolicy < ApplicationPolicy
	def index?
		return true
	end

	def create?
		return !record.provider || user.providers.include?(record.provider) || user.admin
	end

	def update?
		return !record.provider || user.providers.include?(record.provider) || user.admin
	end

	def show?
		return true
	end

	def destroy?
		return !record.provider || user.providers.include?(record.provider) || user.admin
	end
end