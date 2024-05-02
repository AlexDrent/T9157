


Rails.application.routes.draw do

  resources :plc_meetings do
    resources :agenda_items
    end
  resources :committee_meetings do
    resources :committee_agenda_items
  end
  get 'change/roles'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Define routes for home controller
  get 'home/about'
  root "home#index"
  get 'change/roles'
  get 'plc_meetings/index'
  get 'committee_meetings/index'

  # get 'users' => 'change#users'
  # get 'users/edit' => 'change#edit'
  # post 'users/edit' => 'change#edit'
  # get 'users/new' => 'change#new'



  # get 'users/update' => 'change#update'
  # post 'users/update' => 'change#update'

  # Custom sign out route


  # Devise routes with custom controllers
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'

  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    resource :registration, only: [:new, :create, :edit, :destroy], path: 'users', controller: 'devise/registrations', as: :user_registration

    resource :session, only: [:new, :create, :destroy], path: 'users', controller: 'devise/sessions', as: :user_session

    #"this is cool i like this this is good i talk about this when present" -ungabunga alex
    authenticated :user do
      root 'users/registrations#edit', as: :authenticated_root
    end

    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end

  end



  resources :plc_meetings do
    resources :agenda_items, only: [:new, :create]
  end
  resources :committee_meetings do
    resources :committee_agenda_items, only: [:new, :create]
  end
  # Manually add the session routes while skipping others
#   devise_scope :user do
#   end
end


