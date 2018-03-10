Rails.application.routes.draw do
	resources :users, only: [:index, :show]
	resources :posts, only: [:index]

	resources :posts do
		collection do
			post :like
			post :unlike
		end
	end

	root :to => "posts#index"
end
