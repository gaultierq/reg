require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!())
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", technician_path(@technician), "post" do
    end
  end
end
