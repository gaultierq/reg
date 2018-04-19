require "rails_helper"

RSpec.describe User::FaucetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user/faucets").to route_to("technician/faucets#index")
    end

    it "routes to #new" do
      expect(:get => "/user/faucets/new").to route_to("technician/faucets#new")
    end

    it "routes to #show" do
      expect(:get => "/user/faucets/1").to route_to("technician/faucets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user/faucets/1/edit").to route_to("technician/faucets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user/faucets").to route_to("technician/faucets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user/faucets/1").to route_to("technician/faucets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user/faucets/1").to route_to("technician/faucets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user/faucets/1").to route_to("technician/faucets#destroy", :id => "1")
    end

  end
end
