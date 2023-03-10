require 'rails_helper'

RSpec.describe "Welcomes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/welcome/index"
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get "/welcome/index"
      expect(response).to render_template("index")
    end

    it "does render a default layout" do
      get "/welcome/index"
      expect(response).to render_template("layouts/application")
    end
  end
end
