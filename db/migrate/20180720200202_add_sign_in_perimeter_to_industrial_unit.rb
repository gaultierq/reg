class AddSignInPerimeterToIndustrialUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :industrial_units, :sign_in_perimeter, :integer, default: 1_000
  end
end
