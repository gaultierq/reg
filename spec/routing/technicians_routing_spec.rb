require "rails_helper"

RSpec.describe TechniciansController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/technicians").to route_to("technicians#index")
    end

    it "routes to #new" do
      expect(:get => "/technicians/new").to route_to("technicians#new")
    end

    it "routes to #show" do
      expect(:get => "/technicians/1").to route_to("technicians#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/technicians/1/edit").to route_to("technicians#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/technicians").to route_to("technicians#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/technicians/1").to route_to("technicians#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/technicians/1").to route_to("technicians#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/technicians/1").to route_to("technicians#destroy", :id => "1")
    end

  end
end
