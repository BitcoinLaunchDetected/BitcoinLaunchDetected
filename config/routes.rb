Rails.application.routes.draw do
  resources :transactions
  root to: "home#index"

  devise_for :users
end
