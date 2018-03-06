# frozen_string_literal: true

require 'test_helper'

module V1
	class ProvidersControllerTest < ActionDispatch::IntegrationTest
		setup do
			user = users(one)
			
			@header = {
				"X-User-Email": user.email,
				"X-User_Token": user.authentication_token
			}
		end
	end
end