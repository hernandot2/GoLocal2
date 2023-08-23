Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords'}
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :events
  resources :locations
  resources :ratings
  resources :favorites, only: [:new, :create, :destroy]
  resources :cities
  resources :neighborhoods
  resources :profiles
  resources :search, only: :index
end
