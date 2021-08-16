Rails.application.routes.draw do
  # get 'reviews/new'
  # get 'reviews/create'
  # get 'bookings/show'
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/update'
  # get 'pokespots/index'
  # get 'pokespots/show'
  # get 'pokespots/new'
  # get 'pokespots/create'
  # get 'pokespots/edit'
  # get 'pokespots/update'
  # get 'pokespots/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :pokespots do
    resources :bookings, only: [ :new, :show, :create, :update] do
      resources :reviews, only: [ :new, :create ]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
