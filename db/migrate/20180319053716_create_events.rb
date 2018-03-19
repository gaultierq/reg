class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :tap, foreign_key: true
      t.integer :kind, null: false, default: 0

      t.timestamps
    end
  end
end
