class CreateAlerts < ActiveRecord::Migration[5.2]
  def change
    create_table :alerts do |t|
      t.references :industrial_unit, foreign_key: true
      t.references :faucet, foreign_key: true
      t.integer :kind, null: false, default: 0
      t.date :date

      t.timestamps
    end
  end
end
