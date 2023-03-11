Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "welcome#index"

  get "/welcome/index", to: "welcome#index"

  draw 'webhook_routes'
end

