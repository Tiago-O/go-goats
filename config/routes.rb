Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, except: [:index, :new, :create] do
    resources :reservations, only: [:index, :show]
  end

  resources :goats do
    resources :reservations, only: [:create]
    resources :reviews, only: [:create]
  end

  resources :reservations, only: [:destroy, :update]
  resources :reviews, only: [:destroy, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
