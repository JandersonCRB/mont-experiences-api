class User < ApplicationRecord
	acts_as_token_authenticatable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable,  :trackable, :validatable,
				 :confirmable, :allow_unconfirmed_access_for => nil #, :omniauthable

	

	validates :first_name, length: {in: 2..20},  allow_nil: true, allow_blank: true
	validates :last_name,  length: {in: 2..40},  allow_nil: true, allow_blank: true
	validates :telephone,  length: {in: 11..15}, allow_nil: true, allow_blank: true

	has_many :bookings
	has_many :managements
	has_many :providers, through: :managements

	# def self.from_omniauth(auth)
	# 	user = User.where(email: auth.info.email).first
	#  	if user
	#  		user.first_name = auth.info.first_name  if user.first_name.blank?
	#  		user.last_name  = auth.info.last_name  if user.last_name.blank?
 	# 		user.image      = auth.info.image if !user.image
	#     user.uid        = auth.info.uid   if !user.uid
	#     user.provider   = auth.provider   if !user.provider
	#  		return user
	#  	else
	# 	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	# 	    user.email      = auth.info.email
	# 	    user.password   = Devise.friendly_token[0,20] if !user.password.present?
	# 	    user.first_name = auth.info.first_name
	# 	    user.last_name  = auth.info.last_name
	# 	    user.image      = auth.info.image
	# 	    user.uid        = auth.info.uid
	# 	    user.provider   = auth.provider
	# 	    # If you are using confirmable and the provider(s) you use validate emails, 
	# 	    # uncomment the line below to skip the confirmation emails.
	# 	    user.skip_confirmation!
	# 	  end
	# 	end
	# end
end
