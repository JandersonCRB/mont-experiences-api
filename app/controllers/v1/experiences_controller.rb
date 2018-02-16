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
  def update
     # if @experience.update(experience_params)
     #    format.html { redirect_to @experience, notice: 'Experiência atualizada com sucesso.' }
     #    format.json { render :show, status: :ok, location: @experience }
     #  else
     #    format.html { render :edit }
     #    format.json { render json: @experience.errors, status: :unprocessable_entity }
     #  end
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
