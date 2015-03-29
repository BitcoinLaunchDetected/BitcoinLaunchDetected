Rails.application.routes.draw do
  resources :transactions do
    get '/affirm', to: 'transactions#affirm', on: :collection

    member do
      get '/proceed', to: 'transactions#proceed'
      get '/status', to: 'transactions#status'
    end
  end

  root to: 'home#index'

  devise_for :users
end
