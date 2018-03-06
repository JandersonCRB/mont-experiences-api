class ProviderPolicy < ApplicationPolicy
	def index?
		return true
	end

	def create?
		return true
	end

	def update?
		return record.users.include?(user) || user.admin #Checks if user is an provider employee/owner or an admin
	end

	def show?
		return true
	end

	def destroy?
		return record.users.include?(user) || user.admin #Checks if user is an provider employee/owner or an admin
	end

	def create_employee?
		return record.users.include?(user) && record.managements.where(user: user).first.role == "owner"
	end

	def remove_employee?
		return record.users.include?(user) && record.managements.where(user: user).first.role == "owner"
	end
end