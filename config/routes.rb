Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :pokespots do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:show, :update] do
    resources :reviews, only: [:new, :create]
  end


  get 'dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
