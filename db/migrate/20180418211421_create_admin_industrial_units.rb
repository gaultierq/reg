class CreateAdminIndustrialUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_industrial_units do |t|
      t.references :admin, foreign_key: true
      t.references :industrial_unit, foreign_key: true

      t.timestamps
    end
  end
end
