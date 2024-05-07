require "rails_helper"

RSpec.describe TestCyclesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/test_cycles").to route_to("test_cycles#index")
    end

    it "routes to #new" do
      expect(get: "/test_cycles/new").to route_to("test_cycles#new")
    end

    it "routes to #show" do
      expect(get: "/test_cycles/1").to route_to("test_cycles#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/test_cycles/1/edit").to route_to("test_cycles#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/test_cycles").to route_to("test_cycles#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/test_cycles/1").to route_to("test_cycles#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/test_cycles/1").to route_to("test_cycles#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/test_cycles/1").to route_to("test_cycles#destroy", id: "1")
    end
  end
end
