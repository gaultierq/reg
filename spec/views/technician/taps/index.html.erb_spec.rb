require 'rails_helper'

RSpec.describe "user/taps/index", type: :view do
  before(:each) do
    assign(:technician_taps, [
      User::Tap.create!(),
      User::Tap.create!()
    ])
  end

  it "renders a list of user/taps" do
    render
  end
end
