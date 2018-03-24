require "rails_helper"

RSpec.describe Admin::Peoples, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/peoples").to route_to("admin/users#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/peoples/new").to route_to("admin/users#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/peoples/1").to route_to("admin/users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/peoples/1/edit").to route_to("admin/users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/peoples").to route_to("admin/users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/peoples/1").to route_to("admin/users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/peoples/1").to route_to("admin/users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/peoples/1").to route_to("admin/users#destroy", :id => "1")
    end

  end
end
