Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users, except [:index, :new, :create]
  resources :goats do
    resources :reserves
    resources :reviews, only [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
