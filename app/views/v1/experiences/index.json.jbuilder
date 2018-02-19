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
	json.category        experience.categories.first.name if experience.categories.first.present?
	json.cover_photo_url "http://s3-sa-east-1.amazonaws.com/montviagens.com/photos/images/#{experience.cover_photo_id}/original/#{experience.cover_photo.image_file_name}" if experience.cover_photo.present?
end