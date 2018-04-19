require 'rails_helper'

RSpec.describe "user/faucets/show", type: :view do
  before(:each) do
    @technician_tap = assign(:technician_tap, User::Faucet.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
