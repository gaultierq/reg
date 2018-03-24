require 'rails_helper'

RSpec.describe "user/taps/show", type: :view do
  before(:each) do
    @technician_tap = assign(:technician_tap, User::Tap.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
