RSpec.describe Webhooks::WebhooksController, type: :request do
  describe :POST, '/webhooks/webhooks' do
    let(:webhook) { build(:webhook) }
    let(:params) { { webhook:
                      {
                        url: webhook.url,
                        event: webhook.event,
                        name: webhook.name
                      }
                  } }

    it 'creates a webhook' do
      expect {
        post '/webhooks/webhooks', params: params
      }.to change(Webhooks::Webhook, :count).by(1)
    end

    it 'returns the webhook' do
      post '/webhooks/webhooks', params: params
      expect(response.body).to eq(Webhooks::Webhook.last.to_json)
    end
  end

  describe :POST, '/webhooks/webhooks/callback' do
    let(:webhook) { create(:webhook) }
    let(:params) { {
                    event: webhook.event,
                    secret: webhook.secret,
                    webhook_params: { foo: "bar" }
                  } }

    it 'executes the webhook' do
      expect(HTTParty).to receive(:post).with(webhook.url, body: params[:webhook_params])
      post "/webhooks/webhooks/callback/#{params[:event]}", params: params
    end
  end
end