class AddToToInquiry < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :to, :string
  end
end
