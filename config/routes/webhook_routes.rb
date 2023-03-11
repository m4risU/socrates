Rails.application.routes.draw do
  namespace :webhooks do
    post "/webhooks/callback/:event", to: "webhooks#callback"
    post "/webhooks", to: "webhooks#create"
    get "/webhooks/new", to: "webhooks#new"
  end
end