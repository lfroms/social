Rails.application.routes.draw do
	get 'friends', to: 'friends#index'
	post 'friends/destroy', to: "friends#destroy"
	resources :friend_requests

	resources :users, only: [:index, :new, :show, :create]
	resources :posts, only: [:index, :create]
	resources :comments, only: [:create]

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
