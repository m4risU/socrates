json.extract! webhook, :id, :url, :name, :event, :created_at, :updated_at
json.url webhook_url(webhook, format: :json)
