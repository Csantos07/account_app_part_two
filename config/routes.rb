Rails.application.routes.draw do
  # get 'sandbox/card'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "accounts#index"

  resources :accounts
  resources :transactions
  resources :forecasts do
    get :estimate, on: :collection
  end
end
