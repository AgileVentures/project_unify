Rails.application.routes.draw do

  apipie

  root to: 'application#welcome'
  namespace :api do
    namespace :v1 do

      resources :users, only: [:index, :show], constraints: {format: /(json)/}
      get 'unify/:id', controller: :users, action: :unify, as: :unify, constraints: {format: /(json)/}
      post 'skills/:id', controller: :users, action: :skills, as: :skills, constraints: {format: /(json)/}
      get 'user/:id/friendship/:friend_id', controller: :users, action: :friendship, as: :friendship,constraints: {format: /(json)/}
      get 'user/:id/friendship/:friend_id/confirm', controller: :users, action: :confirm_frienship , as: :confirm_frienship, constraints: {format: /(json)/}
      get 'user/:id/friendship/:friend_id/block', controller: :users, action: :block_frienship , as: :block_frienship, constraints: {format: /(json)/}
      resources :activities, only: [:index]
    end

    namespace :v0 do
      resources :ping, only: [:index], constraints: {format: /(json)/}
    end

  end
  devise_for :users,
             path: 'api/v1/users',
             controllers: {registrations: 'api/v1/registrations',
                           sessions: 'api/v1/sessions',
                           omniauth_callbacks: 'api/v1/omniauth_callbacks',
                           application: 'api'}
  resources :users
  resources :tags, as: 'acts_as_taggable_on_tag'
  resource :session, only: [:new, :create, :destroy]


end
