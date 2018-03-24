require "rails_helper"

RSpec.describe User::TapsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user/taps").to route_to("technician/taps#index")
    end

    it "routes to #new" do
      expect(:get => "/user/taps/new").to route_to("technician/taps#new")
    end

    it "routes to #show" do
      expect(:get => "/user/taps/1").to route_to("technician/taps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user/taps/1/edit").to route_to("technician/taps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user/taps").to route_to("technician/taps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user/taps/1").to route_to("technician/taps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user/taps/1").to route_to("technician/taps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user/taps/1").to route_to("technician/taps#destroy", :id => "1")
    end

  end
end
