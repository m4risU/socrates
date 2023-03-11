class Webhook < ApplicationRecord
  include Rails.application.routes.url_helpers

  validates :url, presence: true, url: true
  validates :event, presence: true
  validates :name, presence: true
  validates :secret, presence: true

  before_validation :generate_secret, on: :create

  def execute(params)
    HTTParty.post(url, body: params)
  end

  def curl_to_callback_example
    curl_example = "curl -X POST -H 'Content-Type: application/json' -d '{\"webhook_params\": {\"foo\": \"bar\"}, \"secret\": \"#{secret}\"}' #{callback_webhooks_url(event: event)}"
    curl_example
  end


  private

  def generate_secret
    self.secret = SecureRandom.hex(20)
  end
end