json.array! @experiences do |experience|
	json.id              experience.id
	json.name            experience.name
	json.description     experience.description
	json.location        experience.location
	json.latitude        experience.latitude
	json.longitude       experience.longitude
	json.itinerary       experience.itinerary
	json.observation     experience.observation
	json.price           experience.price
	json.active          experience.active
	json.duration        experience.duration
	json.language        experience.language
	json.cancelation     experience.payment_method
	json.calendar        experience.calendar
	json.about_booking   experience.about_booking
	json.recommended     experience.recommended
	json.about_transfer  experience.about_transfer
	json.has_transfer    experience.has_transfer
	json.category        experience.categories.first.name if experience.categories.first.present?
	if Rails.env.production?
		json.cover_photo_url experience.cover_photo.image.url(:medium) if experience.cover_photo.present?
	else
		json.cover_photo_url request.base_url + experience.cover_photo.image.url(:medium) if experience.cover_photo.present?
	end
end