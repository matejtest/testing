require 'sidekiq/web'
require 'api_constraints'

Rails.application.routes.draw do

	mount Sidekiq::Web => '/sidekiq'

	root 'home#index'
	get 'logout' => 'sessions#destroy', :as => 'logout'

	get 'upload' => 'files#upload'
	post 'import_data' => 'files#import_data'

	resources :samples, :only => :index

	resources :signup, :only => [:new, :create]

	resources :sessions, :only => [:new, :create]

	resources :images, :only => [:index, :new, :create]

	resources :users, :except => [:index, :new] do
		resources :expenses, :except => [:index, :new] do
			collection do
				get :filter
			end
		end

		member do
			get :report
			get :user_details
		end
	end

	#API
	namespace :api, :defaults => { :format => 'json'} do
		scope module: :v1, :constraints => ApiConstraints.new(version: 1, default: true) do

			resources :sessions, :only => [:create, :destroy]

			resources :users, :except => [:new, :edit] do

				collection do
					get :loggedin_user
				end

				resources :expenses, :except => [:new, :edit] do
					collection do
						get :filter
					end
				end

				member do
					get :report
				end
			end

			resources :filters, :only => [:index]

		end
	end

end
