class MakeAddressNullable < ActiveRecord::Migration[5.2]
  def change
    change_column_null :industrial_units, :address, true
    change_column_null :industrial_units, :postcode, true
    change_column_null :industrial_units, :city, true
    change_column_null :industrial_units, :country, true

    change_column_null :industrial_units, :latitude, false
    change_column_null :industrial_units, :longitude, false
  end
end
