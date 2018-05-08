require 'rails_helper'

RSpec.describe "Admin::Attachments", type: :request do
  describe "GET /admin_attachments" do
    it "works! (now write some real specs)" do
      get admin_attachments_path
      expect(response).to have_http_status(200)
    end
  end
end
