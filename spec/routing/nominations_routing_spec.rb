require "spec_helper"

describe NominationsController do
  describe "routing" do

    it "routes to #index" do
      get("/nominations").should route_to("nominations#index")
    end

    it "routes to #new" do
      get("/nominations/new").should route_to("nominations#new")
    end

    it "routes to #show" do
      get("/nominations/1").should route_to("nominations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/nominations/1/edit").should route_to("nominations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/nominations").should route_to("nominations#create")
    end

    it "routes to #update" do
      put("/nominations/1").should route_to("nominations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/nominations/1").should route_to("nominations#destroy", :id => "1")
    end

  end
end
