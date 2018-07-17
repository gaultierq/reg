class CreateRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :registrations do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :phone_number
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
