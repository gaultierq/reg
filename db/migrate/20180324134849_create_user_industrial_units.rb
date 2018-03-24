class CreateUserIndustrialUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :user_industrial_units do |t|
      t.references :user, foreign_key: true
      t.references :industrial_unit, foreign_key: true

      t.timestamps
    end
  end
end
