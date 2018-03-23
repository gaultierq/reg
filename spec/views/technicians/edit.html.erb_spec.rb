require 'rails_helper'

RSpec.describe "technicians/edit", type: :view do
  before(:each) do
    @technician = assign(:technician, Technician.create!())
  end

  it "renders the edit technician form" do
    render

    assert_select "form[action=?][method=?]", technician_path(@technician), "post" do
    end
  end
end
