class V1::ExperiencesController < ApplicationController
	before_action :set_experience, except: [:index, :create]

	# GET /v1/experiences
	def index
		@experiences = Experience.where(nil) #Get all experiences
		@experiences = @experiences.active     (params[:active])      if params[:active].present?
		@experiences = @experiences.recommended(params[:recommended]) if params[:recommended].present?
		@experiences = @experiences.starts_with(params[:starts_with]) if params[:starts_with].present?
		@experiences = @experiences.order_by   (params[:order])       if params[:order].present?
		
		render :index, status: :ok
	end

	# POST /v1/experiences
	def create
		@experience = Experience.new(experience_params)

		if @experience.save
			render :show, status: :created
		else
			render json: { errors: @experience.errors.messages },
						 status: :unprocessable_entity
		end
	end

	# PATCH /v1/experiences/:id
	def update
		if @experience.update(experience_params)
			render :show, status: :created
		else
			render json: { errors: @experience.errors.messages },
						 status: :unprocessable_entity
		end
	end

	# GET /v1/experiences/:id
	def show
		render :show, status: :ok
	end

	# DELETE /v1/experiences/:id
	def destroy
		@experience.destroy

		render head :no_content
	end

	private
	  #Função de callback executada antes da execução do código (before_action)
		def set_experience
	      @experience = Experience.find(params[:id])
    end

    #Permite apenas que os parâmetros abaixo sejam modificados
		def experience_params
			params.require(:experience).permit(:name, :location, :latitude   , :longitude     , :has_transfer, :description, :itinerary     , :observation,  :price, :active, :language, :duration, :cover_photo, 
																				 :about_booking  , :cancelation, :payment_method, :calendar    , :recommended, :about_transfer, :about_location, :category_ids
				)
		end
end
