class Webhooks::Webhook < ApplicationRecord
  validates :url, presence: true, url: true
  validates :event, presence: true
  validates :name, presence: true
  validates :secret, presence: true

  before_validation :generate_secret, on: :create

  def execute(params)
    HTTParty.post(url, body: params)
  end

  private

  def generate_secret
    self.secret = SecureRandom.hex(20)
  end
end