Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: "places#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]
  
  get 'messages/new'
  resources :messages, only: [:new, :create]

end 
