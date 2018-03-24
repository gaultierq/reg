require 'rails_helper'

RSpec.describe "user/taps/edit", type: :view do
  before(:each) do
    @technician_tap = assign(:technician_tap, User::Tap.create!())
  end

  it "renders the edit technician_tap form" do
    render

    assert_select "form[action=?][method=?]", technician_tap_path(@technician_tap), "post" do
    end
  end
end
