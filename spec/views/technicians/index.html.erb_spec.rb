require 'rails_helper'

RSpec.describe "technicians/index", type: :view do
  before(:each) do
    assign(:technicians, [
      Technician.create!(),
      Technician.create!()
    ])
  end

  it "renders a list of technicians" do
    render
  end
end
