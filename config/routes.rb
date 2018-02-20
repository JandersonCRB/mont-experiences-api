Rails.application.routes.draw do
	devise_for :users
	namespace :v1, defaults: { format: :json } do
		resources :experiences
		resources :categories
		resource  :sessions, only: [:create, :destroy]
		resources :bookings do
			member do
				put 'cancel'
			end
		end
		resources :users, only: [:create]
	end
end
