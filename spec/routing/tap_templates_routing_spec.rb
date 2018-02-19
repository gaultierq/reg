require "rails_helper"

RSpec.describe TapTemplatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tap_templates").to route_to("tap_templates#index")
    end

    it "routes to #new" do
      expect(:get => "/tap_templates/new").to route_to("tap_templates#new")
    end

    it "routes to #show" do
      expect(:get => "/tap_templates/1").to route_to("tap_templates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tap_templates/1/edit").to route_to("tap_templates#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tap_templates").to route_to("tap_templates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tap_templates/1").to route_to("tap_templates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tap_templates/1").to route_to("tap_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tap_templates/1").to route_to("tap_templates#destroy", :id => "1")
    end

  end
end
