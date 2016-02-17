Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  namespace :api do
    namespace :v0 do
      resources :ping, only: [:index], constraints: { format: /(text|json)/ }
    end

  end
  root to: 'application#welcome'
end
