class BookingPolicy < ApplicationPolicy
	class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end
	def index?
		return true
	end

	def create?
		return user.admin
	end

  def cancel?
		return record.user == user
	end

	def update?
		return user.admin
	end

	def show?
		return user.admin || user == record.user
	end

	def destroy?
		return user.admin
	end
end