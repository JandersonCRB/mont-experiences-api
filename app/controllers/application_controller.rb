class ApplicationController < ActionController::API
	before_action :authorize_jwt
	include Pundit
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	#DESATIVAR MENSAGENS DE FLASH DO DEVISE
	def is_flashing_format?
	  false
	end

	def user_not_authorized
		head(:unauthorized)
	end

	def authorize_jwt
		token = request.headers["Authorization"]
		return nil if token.nil?
		begin
			secret = Rails.application.secrets.secret_key_base
			decoded = (JWT.decode token, secret, true, { algorithm: 'HS256' }).first
			sign_in User.find(decoded["user_id"]) #DEVISE SIGN IN
		rescue
			@error_message="Invalid authentication token"
			render json: {error: @error_message}, status: :unauthorized
		end
	end
end
