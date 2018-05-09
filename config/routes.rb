Rails.application.routes.draw do
  devise_scope :user do
    root :to => 'devise/sessions#new'
    get "/login" => "devise/sessions#new"
    get "/signup" => "devise/registrations#new", as: "new_user_registration"
  end

  devise_for :users, controllers: { registrations: 'registrations' }

  get 'friends', to: 'friends#index'
  post 'friends/destroy', to: "friends#destroy"
  resources :friend_requests

  resources :users, only: [:new, :show, :create]
  resources :posts, only: [:index, :create]
  resources :comments, only: [:create]

  resources :searches

  resources :post do
    member do
      post "like_toggle", to: "posts#like_toggle"
    end
  end

  # Action Cable

  mount ActionCable.server => '/cable'

  # Aliases

  get '/feed', to: 'posts#index'
end
