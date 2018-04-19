require "rails_helper"

RSpec.describe FaucetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/faucets").to route_to("faucets#index")
    end

    it "routes to #new" do
      expect(:get => "/faucets/new").to route_to("faucets#new")
    end

    it "routes to #show" do
      expect(:get => "/faucets/1").to route_to("faucets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/faucets/1/edit").to route_to("faucets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/faucets").to route_to("faucets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/faucets/1").to route_to("faucets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/faucets/1").to route_to("faucets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/faucets/1").to route_to("faucets#destroy", :id => "1")
    end

  end
end
