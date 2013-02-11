require "spec_helper"

describe ChallengersController do
  describe "routing" do

    it "routes to #index" do
      get("/challengers").should route_to("challengers#index")
    end

    it "routes to #new" do
      get("/challengers/new").should route_to("challengers#new")
    end

    it "routes to #show" do
      get("/challengers/1").should route_to("challengers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/challengers/1/edit").should route_to("challengers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/challengers").should route_to("challengers#create")
    end

    it "routes to #update" do
      put("/challengers/1").should route_to("challengers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/challengers/1").should route_to("challengers#destroy", :id => "1")
    end

  end
end
