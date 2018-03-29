class V1::SessionsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

	def show
			render :show, status: :ok
	end

	def create
		user = User.where(email: params[:email]).first

		if (token = user&.generate_token(params[:password]))
			render json: {token: token}, status: :created
		else
			head(:not_found)
		end
	end

	def destroy
		# current_user&.authentication_token = nil
		# if current_user&.save
		# 	head(:ok)
		# else
		# 	head(:unauthorized)
		# end
		head(:unauthorized)
	end
end