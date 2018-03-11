Rails.application.routes.draw do
	get 'sessions/new'

	resources :users, only: [:index, :new, :show, :create]
	resources :posts, only: [:index]

	resources :posts do
		collection do
			post :like
			post :unlike
		end
	end

	get '/feed', to: 'posts#index'

	get '/signup', to: 'users#new'
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'

	root :to => "sessions#new"
end
