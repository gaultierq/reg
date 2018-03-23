require 'rails_helper'

RSpec.describe "technicians/show", type: :view do
  before(:each) do
    @technician = assign(:technician, Technician.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
