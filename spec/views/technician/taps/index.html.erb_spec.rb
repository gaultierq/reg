require 'rails_helper'

RSpec.describe "user/faucets/index", type: :view do
  before(:each) do
    assign(:technician_taps, [
      User::Faucet.create!(),
      User::Faucet.create!()
    ])
  end

  it "renders a list of user/faucets" do
    render
  end
end
