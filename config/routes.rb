Rails.application.routes.draw do
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }


  root to: "places#index"
  get 'rooms/index'
  resources :users, only: [:edit, :update, :destroy]
  resources :rooms, only: [:index, :new, :create]  do
   resources :messages, only: [:index, :create]
  end

  resources :posts, only: [:index, :create]
end 
