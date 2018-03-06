class ApplicationController < ActionController::API
	acts_as_token_authentication_handler_for User, fallback: :none
	include Pundit
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	#DESATIVAR MENSAGENS DE FLASH DO DEVISE
	def is_flashing_format?
	  false
	end

	def user_not_authorized
		head(:unauthorized)
	end
end
