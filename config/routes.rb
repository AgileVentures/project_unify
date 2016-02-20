Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show], constraints: { format: /(text|json)/ }
    end

    namespace :v0 do
      resources :ping, only: [:index], constraints: { format: /(text|json)/ }
    end



  end
  resources :users
  resource :session, only: [:new, :create, :destroy]
  root to: 'application#welcome'
end
