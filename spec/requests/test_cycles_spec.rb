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

RSpec.describe "/test_cycles", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # TestCycle. As you add validations to TestCycle, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      TestCycle.create! valid_attributes
      get test_cycles_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      test_cycle = TestCycle.create! valid_attributes
      get test_cycle_url(test_cycle)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_test_cycle_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      test_cycle = TestCycle.create! valid_attributes
      get edit_test_cycle_url(test_cycle)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new TestCycle" do
        expect {
          post test_cycles_url, params: { test_cycle: valid_attributes }
        }.to change(TestCycle, :count).by(1)
      end

      it "redirects to the created test_cycle" do
        post test_cycles_url, params: { test_cycle: valid_attributes }
        expect(response).to redirect_to(test_cycle_url(TestCycle.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new TestCycle" do
        expect {
          post test_cycles_url, params: { test_cycle: invalid_attributes }
        }.to change(TestCycle, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post test_cycles_url, params: { test_cycle: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested test_cycle" do
        test_cycle = TestCycle.create! valid_attributes
        patch test_cycle_url(test_cycle), params: { test_cycle: new_attributes }
        test_cycle.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the test_cycle" do
        test_cycle = TestCycle.create! valid_attributes
        patch test_cycle_url(test_cycle), params: { test_cycle: new_attributes }
        test_cycle.reload
        expect(response).to redirect_to(test_cycle_url(test_cycle))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        test_cycle = TestCycle.create! valid_attributes
        patch test_cycle_url(test_cycle), params: { test_cycle: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested test_cycle" do
      test_cycle = TestCycle.create! valid_attributes
      expect {
        delete test_cycle_url(test_cycle)
      }.to change(TestCycle, :count).by(-1)
    end

    it "redirects to the test_cycles list" do
      test_cycle = TestCycle.create! valid_attributes
      delete test_cycle_url(test_cycle)
      expect(response).to redirect_to(test_cycles_url)
    end
  end
end