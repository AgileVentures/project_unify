Rails.application.routes.draw do

  apipie

  root to: 'application#welcome'
  namespace :api do
    namespace :v1 do

      resources :users, only: [:index, :show], constraints: { format: /(json)/ }
      get 'unify/:id', controller: :users, action: :unify, as: :unify, constraints: { format: /(json)/ }
      post 'skills/:id', controller: :users, action: :skills, as: :skills, constraints: { format: /(json)/ }
    end

    namespace :v0 do
      resources :ping, only: [:index], constraints: { format: /(json)/ }
    end

  end
  devise_for :users,
             path: 'api/v1/users',
             controllers: {registrations: 'api/v1/registrations',
                           sessions: 'api/v1/sessions' }
  resources :users
  resources :tags, as: 'acts_as_taggable_on_tag'
  resource :session, only: [:new, :create, :destroy]


end
