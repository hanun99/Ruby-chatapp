Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'users/index'
  resources :room_messages
  resources :rooms
 # devise_for :users
  root controller: :rooms, action: :index
  resources :users
  resources :rooms do
    resources :messages, only: [:index]
  end

  devise_for :users, controllers: { sessions: 'sessions' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  
  # Defines the root path route ("/")
  # root "posts#index"
end
