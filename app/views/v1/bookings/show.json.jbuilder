json.id @booking.id
json.user do
	json.first_name   @booking.user.first_name
	json.email        @booking.user.email
	json.telephone    @booking.user.telephone

end
json.experience do 
	json.id   @booking.experience.id
	json.name @booking.experience.name
end
json.name       @booking.name
json.phone      @booking.phone
json.dates      @booking.dates
json.comments   @booking.comments
json.address    @booking.address
json.complement @booking.complement
json.cost       @booking.cost
json.adults     @booking.adults
json.children   @booking.children
json.status     @booking.status