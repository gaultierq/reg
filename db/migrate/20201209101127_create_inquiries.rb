class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :message
      t.references :admin, foreign_key: true
      t.integer :theme, default: 0

      t.timestamps
    end
  end
end
