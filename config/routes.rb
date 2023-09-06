Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords'}
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 get '/locations/:id/approve', to: 'locations#approve', as: 'approve_location'

  resources :locations do
    resources :favorites, only: [:create]
  end
  resources :events
  resources :ratings
  resources :favorites, only: [:index, :destroy]
  resources :cities
  resources :neighborhoods
  resources :profiles, only: [:show, :edit, :update]
  resources :search, only: :index
  # resources :locations
end
