class V1::UsersController < ApplicationController
	def create
		@user = User.new(users_params)

		if @user.save
			render :create, status: :ok
		else
			head(:unprocessable_entity)
		end
	end

	private

		def users_params
			params.require(:user).permit(:email, :password)
		end
end