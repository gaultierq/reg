require 'rails_helper'

RSpec.describe "Taps", type: :request do
  describe "GET /taps" do
    it "works! (now write some real specs)" do
      get taps_path
      expect(response).to have_http_status(200)
    end
  end
end
