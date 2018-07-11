class AddNoteToFaucets < ActiveRecord::Migration[5.2]
  def change
    add_column :faucets, :note, :string
  end
end
