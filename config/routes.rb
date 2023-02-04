Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :places, only: [:index, :show]
  resources :trips, only: [:index, :show]
  get "search/trip", to: "trips#search_trip", as: :search_trip
end
