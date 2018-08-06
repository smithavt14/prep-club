Rails.application.routes.draw do
  # get 'reviews/index'
  # get 'reviews/show'
  # get 'reviews/new'
  # get 'reviews/create'
  # get 'bookings/index'
  # get 'bookings/show'
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/destroy'
  # get 'preps/index'
  # get 'preps/show'
  # get 'preps/new'
  # get 'preps/create'
  # get 'preps/edit'
  # get 'preps/update'
  # get 'preps/destroy'
  devise_for :users
  root to: 'pages#home'

  resources :preps do
    resources :bookings, only: [ :index, :show, :new, :create, :destroy]
    resources :reviews, only: [ :index, :show, :new, :create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
