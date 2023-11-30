Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/fetch_distances', to: 'strava#fetch_distances'
  get '/fetch_auth_token', to: "strava#fetch_auth_token"
  post '/strava/setup', to: 'strava#setup'
  get '/redirect', to: 'strava#redirect'

  root to: "application#home"
  # root to: 'bikes#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get '/shop_locator', to: 'pages#show'

  resources :users, only: %i[new show edit update create destroy]
  resources :bikes do
    resources :bike_components, except: :index
    resources :components, only: :create
  end
  resources :checks, only: :update
end
