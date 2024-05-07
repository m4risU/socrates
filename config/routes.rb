Rails.application.routes.draw do
  resources :test_cycles
  resources :accounts
  resources :products
  resources :webhooks do
    collection do
      post 'callback/:event', to: "webhooks#callback", as: :callback
    end
  end
  resources :uploads

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "welcome#index"

  get "/welcome/index", to: "welcome#index"
end

