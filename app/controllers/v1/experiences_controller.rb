class V1::ExperiencesController < ApplicationController
	def index
		@experiences = Experience.get_active
		render :index, status: :ok
	end
	def create
    @experience = Experience.new(experience_params)

    if @experience.save
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
    params.require(:experience).permit(:name, :description, :itinerary, :observation)
  end
end
