class V1::ExperiencesController < ApplicationController
	def index
		@experiences = Experience.where(nil) #Get all experiences
		@experiences = @experiences.active     (params[:active])      if params[:active].present?
		@experiences = @experiences.recommended(params[:recommended]) if params[:recommended].present?
		@experiences = @experiences.starts_with(params[:starts_with]) if params[:starts_with].present?
		
		render :index, status: :ok
	end
	def create
		@experience = Experience.new(experience_params)

		if @experience.save
			render :show, status: :created
		else
			render json: { errors: @experience.errors.messages },
						 status: :unprocessable_entity
		end
	end
	def update
		@experience = Experience.find(params[:id])
			if @experience.update(experience_params)
				render json: @experience, status: :created
			else
				render json: { errors: @experience.errors.messages },
						 status: :unprocessable_entity
			end
	end
	def show
		@experience = Experience.find(params[:id])
		render :show, status: :ok
	end

	def experience_params
		params.require(:experience).permit(:name, :location, :latitude   , :longitude     , :has_transfer, :description, :itinerary     , :observation,  :price, :active, :language, :duration, :cover_photo, 
																			 :about_booking  , :cancelation, :payment_method, :calendar    , :recommended, :about_transfer, :about_location, :category_ids
			)
	end
end
