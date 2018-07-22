class AddDefaultValueToIndustrialUnit < ActiveRecord::Migration[5.2]
  def change
    change_column_default :industrial_units, :latitude, 0
    change_column_default :industrial_units, :longitude, 0
  end
end
