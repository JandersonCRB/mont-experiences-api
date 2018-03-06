class BookingMailer < ApplicationMailer
	default from: 'agendamento@montviagens.com'

	default_url_options[:host]

	def send_email_to_mont(booking)
		@booking    = booking
		@experience = booking.experience
		@user       = booking.user

		montmail = "agendamento@montviagens.com"
		montmail = "janderson@montviagens.com" if Rails.env == "development"
		mail(to: montmail, subject: "New Booking! - #{@booking.name}")
	end
end
