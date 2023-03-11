require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/webhooks", type: :request do

  # This should return the minimal set of attributes required to create a valid
  # Webhook. As you add validations to Webhook, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Webhook.create! valid_attributes
      get webhooks_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      webhook = Webhook.create! valid_attributes
      get webhook_url(webhook)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_webhook_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      webhook = Webhook.create! valid_attributes
      get edit_webhook_url(webhook)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Webhook" do
        expect {
          post webhooks_url, params: { webhook: valid_attributes }
        }.to change(Webhook, :count).by(1)
      end

      it "redirects to the created webhook" do
        post webhooks_url, params: { webhook: valid_attributes }
        expect(response).to redirect_to(webhook_url(Webhook.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Webhook" do
        expect {
          post webhooks_url, params: { webhook: invalid_attributes }
        }.to change(Webhook, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post webhooks_url, params: { webhook: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested webhook" do
        webhook = Webhook.create! valid_attributes
        patch webhook_url(webhook), params: { webhook: new_attributes }
        webhook.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the webhook" do
        webhook = Webhook.create! valid_attributes
        patch webhook_url(webhook), params: { webhook: new_attributes }
        webhook.reload
        expect(response).to redirect_to(webhook_url(webhook))
      end
    end

    context "with invalid parameters" do

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        webhook = Webhook.create! valid_attributes
        patch webhook_url(webhook), params: { webhook: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested webhook" do
      webhook = Webhook.create! valid_attributes
      expect {
        delete webhook_url(webhook)
      }.to change(Webhook, :count).by(-1)
    end

    it "redirects to the webhooks list" do
      webhook = Webhook.create! valid_attributes
      delete webhook_url(webhook)
      expect(response).to redirect_to(webhooks_url)
    end
  end

  describe :POST, '/webhooks/callback' do
    let(:webhook) { create(:webhook) }
    let(:params) { {
                    event: webhook.event,
                    secret: webhook.secret,
                    webhook_params: { foo: "bar" }
                  } }

    it 'executes the webhook' do
      expect(HTTParty).to receive(:post).with(webhook.url, body: params[:webhook_params])
      post "/webhooks/callback/#{params[:event]}", params: params
    end
  end
end
