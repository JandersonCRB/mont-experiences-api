class V1::PhotosController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	after_action  :verify_authorized
	def index
		@experience = Experience.find(params[:experience_id])
		@photos = Photo.where(experience: @experience)
		@cover_photo = @experience.cover_photo
		authorize @photos

		render :index, status: :ok
	end
	def create
		@experience = Experience.find(params[:experience_id])
		@cover_photo = @experience.cover_photo
		authorize @photos
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
		authorize @cover_photo
		
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
		authorize @photo
		if @photo.destroy
			@photos = Photo.where(experience_id: experience.id)
			render :index, status: :ok
		else
			head(:unauthorized)
		end

	end
end