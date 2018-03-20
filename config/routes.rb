	Rails.application.routes.draw do
	devise_for :users
	namespace :v1 do
	  resources :experiences do
	  	resources :photos,   only: [:create, :destroy, :index], format: :image do 
	      member do
	        post 'set_cover'
	      end
	    end
	  	member do 
	  		get 'upload_photos'
	  	end
	  end
		resources :categories
		resource  :sessions, only: [:create, :destroy, :show]
		resources :bookings do
			member do
				put 'cancel'
			end
		end
		resources :users, except: [:index, :destroy, :update] do
			collection do
				get 'profile'
			end
		end
		resource :users, only: [:update]
		resources :providers do
			member do
				post 'employee', to: 'providers#create_employee'
				delete 'employee', to: 'providers#remove_employee'
			end
		end
	end
end
