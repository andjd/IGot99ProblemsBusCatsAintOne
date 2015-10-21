Rails.application.routes.draw do

  resources :cats, only: [:index, :show, :new, :create, :update, :edit]

  resources :cat_rental_requests, only: [:new, :create, :show]

  resources :users, only: [:new, :create]

  resource :sessions, only: [:new, :create, :destroy]
end
