json.photos do
	json.array! @photos do |photo|
		json.id                 photo.id
		json.experience_id      photo.experience_id
		json.image_content_type photo.image_content_type
		json.image_file_name    photo.image_file_name
		if Rails.env.production?
			json.url photo.image.url
		else
			json.url "http://www.guiaviajarmelhor.com.br/wp-content/uploads/2017/10/Praias-Brasil-34.jpg"
		end
	end
end

if @cover_photo
	json.cover_photo do
		json.id @cover_photo.id
		json.url "http://www.guiaviajarmelhor.com.br/wp-content/uploads/2017/10/Praias-Brasil-34.jpg"
	end
end