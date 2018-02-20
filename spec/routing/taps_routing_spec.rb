require "rails_helper"

RSpec.describe TapsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/taps").to route_to("taps#index")
    end

    it "routes to #new" do
      expect(:get => "/taps/new").to route_to("taps#new")
    end

    it "routes to #show" do
      expect(:get => "/taps/1").to route_to("taps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/taps/1/edit").to route_to("taps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/taps").to route_to("taps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/taps/1").to route_to("taps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/taps/1").to route_to("taps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/taps/1").to route_to("taps#destroy", :id => "1")
    end

  end
end
