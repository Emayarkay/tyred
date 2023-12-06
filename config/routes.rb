Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  get '/fetch_distances', to: 'strava#fetch_distances'
  get '/fetch_auth_token', to: "strava#fetch_auth_token"

  root to: 'bikes#index'
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :users, only: %i[show]
  resources :bikes do
    resources :bike_components, except: [:index, :destroy]
    resources :components, only: :create
    patch 'reset_meter', on: :member
    post 'apply_preset', on: :member
  end
  resources :checks, only: :update
  resources :bike_components, only: :destroy
  resources :bike_shops, only: %i[index]
end
