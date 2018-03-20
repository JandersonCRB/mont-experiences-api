class PhotoPolicy < ApplicationPolicy
	def index?
		return true
	end

	def create?
		return !record.experience.provider || user.providers.include?(record.experience.provider) || user.admin
	end

	def set_cover?
		return !record.experience.provider || user.providers.include?(record.experience.provider) || user.admin
	end

	def destroy?
		return !record.experience.provider || user.providers.include?(record.experience.provider) || user.admin
	end
end