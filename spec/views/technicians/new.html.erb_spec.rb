require 'rails_helper'

RSpec.describe "technicians/new", type: :view do
  before(:each) do
    assign(:technician, Technician.new())
  end

  it "renders new technician form" do
    render

    assert_select "form[action=?][method=?]", technicians_path, "post" do
    end
  end
end
