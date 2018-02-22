Rails.application.routes.draw do
	devise_for :users
	namespace :v1, defaults: { format: :json } do
	  resources :experiences do
	  	resources :photos,   only: [:create, :destroy] do
	      member do
	        post 'set_cover'
	      end
	    end
	  	member do 
	  		get 'upload_photos'
	  	end
	  end
		resources :categories
		resource  :sessions, only: [:create, :destroy]
		resources :bookings do
			member do
				put 'cancel'
			end
		end
		resources :users, only: [:create]
		resources :providers
	end
end
