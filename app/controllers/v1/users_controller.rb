class V1::UsersController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index, :create]
	def create
		@user = User.new(users_params)

		if @user.save
			render :create, status: :created
		else
			render :json => @user.errors.full_messages, status: :unprocessable_entity
		end
	end
	def update
		@user = current_user
		if @user.update(users_params)
			render :show, status: :created
		else
			render json: { errors: @user.errors.messages },
						 status: :unprocessable_entity
		end
	end
	def show
		@user = User.find(params[:id])
		render :show, status: :ok
	end

	def profile
		@user = current_user
		render :profile, status: :ok
	end

	private

		def users_params
			params.require(:user).permit(:email, :first_name, :last_name, :telephone, :password, :password_confirmation)
		end
end