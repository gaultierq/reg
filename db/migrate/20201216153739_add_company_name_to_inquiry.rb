class AddCompanyNameToInquiry < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :company_name, :string
  end
end
