require 'rails_helper'

RSpec.describe "User::Taps", type: :request do
  describe "GET /technician_taps" do
    it "works! (now write some real specs)" do
      get technician_taps_path
      expect(response).to have_http_status(200)
    end
  end
end
