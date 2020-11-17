Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: "places#index"
  get 'rooms/index'
  resources :users, only: [:edit, :update, :destroy]
  resources :rooms, only: [:index, :new, :create, :destroy]  do
   resources :messages, only: [:index, :create]
  end

  resources :posts, only: [:index, :create]
end 
