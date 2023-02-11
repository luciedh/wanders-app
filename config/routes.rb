Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'
  devise_for :users
  root to: "pages#home"
  resources :places, only: [:index, :show] do
    resources :comments, only: [:index, :new, :create]
  end
  resources :trips, only: [:index, :show]
  get "search/trip", to: "trips#search_trip", as: :search_trip
end
