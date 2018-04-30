class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :faucet, foreign_key: true
      t.integer :kind, null: false, default: 0
      t.text :comment
      t.references :admin, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
