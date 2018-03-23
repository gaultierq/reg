require 'rails_helper'

RSpec.describe "Technicians", type: :request do
  describe "GET /technicians" do
    it "works! (now write some real specs)" do
      get technicians_path
      expect(response).to have_http_status(200)
    end
  end
end
