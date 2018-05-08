require "rails_helper"

RSpec.describe Admin::AttachmentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/attachments").to route_to("admin/attachments#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/attachments/new").to route_to("admin/attachments#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/attachments/1").to route_to("admin/attachments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/attachments/1/edit").to route_to("admin/attachments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/attachments").to route_to("admin/attachments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/attachments/1").to route_to("admin/attachments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/attachments/1").to route_to("admin/attachments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/attachments/1").to route_to("admin/attachments#destroy", :id => "1")
    end

  end
end
