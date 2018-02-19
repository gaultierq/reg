require 'rails_helper'

RSpec.describe "TapTemplates", type: :request do
  describe "GET /tap_templates" do
    it "works! (now write some real specs)" do
      get tap_templates_path
      expect(response).to have_http_status(200)
    end
  end
end
