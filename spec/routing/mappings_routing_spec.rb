require "spec_helper"

describe MappingsController do
  describe "routing" do

    it "routes to #index" do
      get("/mappings").should route_to("mappings#index")
    end

    it "routes to #new" do
      get("/mappings/new").should route_to("mappings#new")
    end

    it "routes to #show" do
      get("/mappings/1").should route_to("mappings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mappings/1/edit").should route_to("mappings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mappings").should route_to("mappings#create")
    end

    it "routes to #update" do
      put("/mappings/1").should route_to("mappings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mappings/1").should route_to("mappings#destroy", :id => "1")
    end

  end
end
