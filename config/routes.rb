Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'
  devise_for :users
  root to: "places#index"
  resources :places, only: [:index, :show] do
    resources :comments, only: [:index, :new, :create]
    resources :user_places, only: [:create]
  end
  resources :comments, only: [:update]
  resources :favourite_places, only: [:index, :create, :destroy]
  resources :trips, only: [:index, :show] do
    resources :user_trips, only: [:create]
  end
  resources :user_trips, only: [:index, :show]
  get "search/trip", to: "trips#search_trip", as: :search_trip
end
