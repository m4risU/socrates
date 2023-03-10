FactoryBot.define do
  factory :webhook, class: 'Webhooks::Webhook' do
    url { Faker::Internet.url }
    event { 'order_created' }
    name { Faker::Name.name }
    secret { SecureRandom.hex(20) }
  end
end