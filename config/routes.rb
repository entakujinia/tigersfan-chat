Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: "places#index"
  get 'messages/new'
  resources :users, only: [:edit, :update, :destroy]
  resources :rooms, only: [:new, :create]  do
   resources :messages, only: [:index, :create]
  end
end 
