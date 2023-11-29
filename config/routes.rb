Rails.application.routes.draw do
  devise_for :users

  root to: "application#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :users, only: %i[new show edit update create destroy]
  resources :bikes do
    resources :bike_components, only: %i[new show edit update create destroy]
  end
  resources :checks, only: :update
end
