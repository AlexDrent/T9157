# Rails.application.routes.draw do
#   devise_for :users
#   #get 'home/index'
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
#
#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check
#   get 'home/about'
#   # Defines the root path route ("/")
#   root "home#index"
#
#   devise_scope :user do
#     get '/users/sign_out' => 'devise/sessions#destroy'
#   end
#
#     devise_for :users, controllers: {
#
#       registrations: 'users/registrations'
#     }
#
#   # config/routes.rb
#
#   # config/routes.rb
#
#
#
#
# end

# Rails.application.routes.draw do
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
#
#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check
#
#   # Define routes for home controller
#   get 'home/about'
#   root "home#index"
#
#   # Custom sign out route
#   devise_scope :user do
#     get '/users/sign_out' => 'devise/sessions#destroy'
#   end
#
#   # Devise routes with custom controllers and skipped sessions
#   devise_for :users, controllers: {
#     sessions: 'users/sessions',
#     registrations: 'users/registrations'
#   }, skip: :sessions
# end


Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Define routes for home controller
  get 'home/about'
  root "home#index"

  # Custom sign out route
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Devise routes with custom controllers
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Manually add the session routes while skipping others
  devise_scope :user do
    resource :session, only: [:new, :create, :destroy], path: 'users', controller: 'devise/sessions'
  end
end


