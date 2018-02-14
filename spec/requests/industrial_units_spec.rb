require 'rails_helper'

RSpec.describe "IndustrialUnits", type: :request do
  describe "GET /industrial_units" do
    it "works! (now write some real specs)" do
      get industrial_units_path
      expect(response).to have_http_status(200)
    end
  end
end
