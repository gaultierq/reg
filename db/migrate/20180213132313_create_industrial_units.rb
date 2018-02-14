class CreateIndustrialUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :industrial_units do |t|
      t.string :name
      t.string :address, null: false
      t.string :postcode, null: false
      t.string :city, null: false
      t.string :country, null: false
      t.float :latitude
      t.float :longitude
      t.text :additional_information
      t.text :process_information

      t.timestamps
    end
  end
end
