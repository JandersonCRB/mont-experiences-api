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
json.recommended     @experience.recommended
json.has_transfer    @experience.has_transfer
json.about_transfer  @experience.about_transfer
json.category        @experience.categories.first.name if @experience.categories.first.present?
json.cover_photo_url request.base_url + @experience.cover_photo.image.url if @experience.cover_photo.present?
json.photos          @experience.photos do |photo|
	json.url photo.image.url
end