Rails.application.routes.draw do
  resources :transactions do
    get '/affirm', to: 'transactions#affirm', on: :collection
  end

  root to: 'home#index'

  devise_for :users
end
