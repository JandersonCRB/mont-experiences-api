class V1::PhotosController < ApplicationController
	def index
		@experience = Experience.find(params[:experience_id])
		@photos = Photo.where(experience: @experience)
		@cover_photo = @experience.cover_photo

		render :index, status: :ok
	end
	def create
		@experience = Experience.find(params[:experience_id])
		@cover_photo = @experience.cover_photo

		if params[:images]
			params[:images].each do |img|
				@experience.photos.create(image: img)
			end
			@photos = @experience.photos
			render :index, status: :created
		else
			head(:unauthorized)
		end

	end
	def set_cover
		@experience = Experience.find(params[:experience_id])
		@cover_photo = Photo.find(params[:id])

		@experience.cover_photo = @cover_photo
		@photos = @experience.photos
		
		if @experience.save
			render :index, status: :ok
		else
			head :unauthorized
		end
	end
	def destroy
		@photo = Photo.find(params[:id])
		experience = @photo.experience
		@cover_photo = experience.cover_photo
		if @photo.destroy
			@photos = Photo.where(experience_id: experience.id)
			render :index, status: :ok
		else
			head(:unauthorized)
		end

	end
end