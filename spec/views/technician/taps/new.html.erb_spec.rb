require 'rails_helper'

RSpec.describe "user/faucets/new", type: :view do
  before(:each) do
    assign(:technician_tap, User::Faucet.new())
  end

  it "renders new technician_tap form" do
    render

    assert_select "form[action=?][method=?]", technician_taps_path, "post" do
    end
  end
end
