class AddOfOnFaucets < ActiveRecord::Migration[5.2]
  def change
    add_column :faucets, :of_id, :string
  end
end
