require 'rails_helper'

RSpec.describe Webhook, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_presence_of(:event) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.not_to be_blank }
  end

  describe "#execute" do
    let(:webhook) { create(:webhook) }

    it "sends a POST request to the webhook url" do
      expect(HTTParty).to receive(:post).with(webhook.url, body: { foo: "bar" })
      webhook.execute({ foo: "bar" })
    end
  end
end