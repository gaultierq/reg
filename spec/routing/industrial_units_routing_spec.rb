require "rails_helper"

RSpec.describe IndustrialUnitsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/industrial_units").to route_to("industrial_units#index")
    end

    it "routes to #new" do
      expect(:get => "/industrial_units/new").to route_to("industrial_units#new")
    end

    it "routes to #show" do
      expect(:get => "/industrial_units/1").to route_to("industrial_units#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/industrial_units/1/edit").to route_to("industrial_units#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/industrial_units").to route_to("industrial_units#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/industrial_units/1").to route_to("industrial_units#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/industrial_units/1").to route_to("industrial_units#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/industrial_units/1").to route_to("industrial_units#destroy", :id => "1")
    end

  end
end
