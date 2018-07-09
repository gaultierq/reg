class AddUniqueToFaucetsSerialNumber < ActiveRecord::Migration[5.2]
  def change
    add_index :faucets, :serial_number, unique: true
  end
end
