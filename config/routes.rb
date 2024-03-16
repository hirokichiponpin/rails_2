Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html'
  root to:'top#index'
  devise_for :users
  get'users/account/:id', to:'users#account', as: :users_account
  get'users/profile/:id', to:'users#profile', as: :users_profile
  resources :users, only: [:edit, :update]
  resources :rooms do
    collection do
      get 'own', to: 'rooms#own', as: :own_rooms
    end
  end
  get '/search', to: 'rooms#search', as: :search
  resources :reservations do
    member do
      get 'editconfirm'
      patch 'confirm_update' 
    end
  end
  post '/confirm', to: 'reservations#confirm', as: :reservations_confirm
end
