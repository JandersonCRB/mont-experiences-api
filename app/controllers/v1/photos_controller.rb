class PhotosController < ApplicationController
	def create
		@experience = Experience.find(params[:experience_id])

		if params[:images]
			params[:images].each do |img|
				@experience.photos.create(image: img)
			end
		end
		@photos = @experience.photos
		redirect_back(fallback_location: request.referer, notice: "Saved...")
	end
	def set_cover
		# @experience = Experience.find(params[:experience_id])
		# @cover = Photo.find(params[:id])
		# @experience.cover_photo = @cover
		# if @experience.save
		# 	flash[:notice] = "Foto de capa alterada com sucesso!"
		# else
		# 	flash[:error] = "Ocorreu um erro."
		# end

		# @photos = @experience.photos
		# respond_to :js
	end
	def destroy
		# @photo = Photo.find(params[:id])
		# experience = @photo.experience

		# @photo.destroy
		# @photos = Photo.where(experience_id: experience.id)

		# respond_to :js
	end
end