Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: "places#index"
  resources :users

  resources :messages, only: [:new, :create]
end 
