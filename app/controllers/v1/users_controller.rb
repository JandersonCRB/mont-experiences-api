class V1::UsersController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index, :create, :reset_password, :update_password]
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
			render json: { errors: @user.errors.messages }, status: :unprocessable_entity
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

  def reset_password
		@user = User.find_by_email(params[:email])
		if @user.present?
			@user.send_reset_password_instructions
			head :ok
		else
			head :unauthorized
		end
	end
	def update_password
		@user = User.reset_password_by_token(reset_password_params)
		if @user.save
				head :ok
		else
			head :unauthorized
		end
	end
	private
		def reset_password_params
			params.require(:user).permit(:reset_password_token, :password, :password_confirmation)
		end
		def users_params
			params.require(:user).permit(:email, :first_name, :last_name, :telephone, :password, :password_confirmation)
		end
end