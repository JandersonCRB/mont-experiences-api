class V1::SessionsController < ApplicationController
	def show
		if current_user
			render :show, status: :ok
		else
		 	render :json => {}, status: :unauthorized
		end
	end

	def create
		user = User.where(email: params[:email]).first

		if user&.valid_password?(params[:password])
			render json: user.as_json(only: [:email, :authentication_token]), status: :created
		else
			render :json => {}, status: :unauthorized
		end
	end

	def destroy
		current_user&.authentication_token = nil
		if current_user&.save
			head(:ok)
		else
			head(:unauthorized)
		end
	end
end