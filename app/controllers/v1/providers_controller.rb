class V1::ProvidersController < ApplicationController
	before_action :set_provider, except: [:create, :index]
	after_action  :verify_authorized

	#GET /v1/providers
	def index
		@providers = Provider.all
		authorize @providers

		render :index, status: :ok
	end

	#POST /v1/providers
	def create
		@provider = Provider.new(provider_params)
		authorize @provider
		@provider.managements.build(user: current_user, role: "owner")

		if @provider.save
			render :show, status: :created
		else
			head(:unauthorized)
		end
	end

	#PATCH /v1/providers/:id
	def update
		if @provider.update(experience_params)
			render :show, status: :created
		else
			render json: { errors: @provider.errors.messages },
						 status: :unprocessable_entity
		end
	end

	#GET /v1/providers/:id
	def show
		render :show, status: :ok
	end
	
	#DELETE /v1/providers/:id
	def destroy
		@provider.destroy

		head :no_content
	end

	#POST /v1/providers/:id
	def create_employee
		@user = User.find_by(email: params[:email])
		@provider.managements.build(user: @user, role: "employee")
		if @provider.save
			render :show, status: :ok
		else
			head(:unauthorized)
		end
	end

	#POST /v1/providers/:id
	def remove_employee
		if @user = User.find_by(email: params[:email])
			if @provider.managements.where(user: @user)&.first.destroy
				head :no_content
			else
				head(:unauthorized)
			end
		else
			head(:unauthorized)
		end
	end


	private
		def set_provider
			@provider = Provider.find(params[:id])
			authorize @provider
		end
		def provider_params
			params.require(:provider).permit(:name, :email, :cpf, :cnpj, :address)
		end
		# def users_params
		# 	params.require(:user).permit(:email)
		# end
end