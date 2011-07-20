require "spec_helper"

describe OpinionsController do
  describe "routing" do

    it "routes to #index" do
      get("/opinions").should route_to("opinions#index")
    end

    it "routes to #new" do
      get("/opinions/new").should route_to("opinions#new")
    end

    it "routes to #show" do
      get("/opinions/1").should route_to("opinions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/opinions/1/edit").should route_to("opinions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/opinions").should route_to("opinions#create")
    end

    it "routes to #update" do
      put("/opinions/1").should route_to("opinions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/opinions/1").should route_to("opinions#destroy", :id => "1")
    end

  end
end
