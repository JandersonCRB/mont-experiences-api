json.id              @experience.id
json.name            @experience.name
json.description     @experience.description
json.provider        @experience.provider
json.location        @experience.location
json.latitude        @experience.latitude
json.longitude       @experience.longitude
json.itinerary       @experience.itinerary
json.observation     @experience.observation
json.price           @experience.price
json.active          @experience.active
json.duration        @experience.duration
json.language        @experience.language
json.cancelation     @experience.cancelation
json.payment_method  @experience.payment_method
json.calendar        @experience.calendar
json.about_booking   @experience.about_booking
json.about_location  @experience.about_location
json.recommended     @experience.recommended
json.has_transfer    @experience.has_transfer
json.about_transfer  @experience.about_transfer
json.category        @experience.categories.first.name if @experience.categories.first.present?
json.category_ids    @experience.categories.first.id if @experience.categories.first.present?
if Rails.env.production?
	json.cover_photo_url "http://www.guiaviajarmelhor.com.br/wp-content/uploads/2017/10/Praias-Brasil-34.jpg" if @experience.cover_photo.present?
else
	json.cover_photo_url "http://www.guiaviajarmelhor.com.br/wp-content/uploads/2017/10/Praias-Brasil-34.jpg" if @experience.cover_photo.present?
end
json.photos          @experience.photos do |photo|
	json.id photo.id
	if Rails.env.production?
		json.url "http://www.guiaviajarmelhor.com.br/wp-content/uploads/2017/10/Praias-Brasil-34.jpg"     
	else
		json.url "http://www.guiaviajarmelhor.com.br/wp-content/uploads/2017/10/Praias-Brasil-34.jpg"
	end
end