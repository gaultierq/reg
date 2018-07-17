# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin
Admin.create(first_name: "Florent", last_name: "Beaurain", email: "beaurain.florent@protonmail.com",
             phone_number: FFaker::PhoneNumberFR.unique.phone_number, password: "password", password_confirmation: "password", kind: "administrator")

# Salesman
10.times do
  Admin.create(first_name: FFaker::Name.first_name , last_name: FFaker::Name.last_name, email: FFaker::Internet.unique.email,
               phone_number: FFaker::PhoneNumberFR.unique.phone_number, password: "password", password_confirmation: "password")
end

# Technician
User.create(first_name: "Gregoire", last_name: "Dubelloy", email: "gregoire.dubelloy@gmail.com",
            phone_number: FFaker::PhoneNumberFR.unique.phone_number, password: "password", password_confirmation: "password")
10.times do
  User.create(first_name: FFaker::Name.first_name , last_name: FFaker::Name.last_name, email: FFaker::Internet.unique.email,
              phone_number: FFaker::PhoneNumberFR.unique.phone_number, password: "password", password_confirmation: "password")
end

# Client
10.times do
  User.create(first_name: FFaker::Name.first_name , last_name: FFaker::Name.last_name, email: FFaker::Internet.unique.email,
              phone_number: FFaker::PhoneNumberFR.unique.phone_number, password: "password", password_confirmation: "password", kind: "client")
end

# Industrial unit
10.times do |i|
  industrial_unit = IndustrialUnit.create(name: "Unité Industrielle n°#{i}", address: FFaker::AddressFR.street_address,
                                          city: FFaker::AddressFR.city, postcode: FFaker::AddressFR.postal_code, country: "France")

  industrial_unit.admin_industrial_units.create!(admin_id: (industrial_unit.id + 1))
  industrial_unit.user_industrial_units.create!(user_id: industrial_unit.id + 1)
  industrial_unit.user_industrial_units.create!(user_id: (industrial_unit.id + 11))
end

# Faucet template
10.times do |i|
  TapTemplate.create name: "Modèle n°#{i}", article_number: "12345#{i}", dn: "98765#{i}"
end

# Faucet
100.times do |i|
  if i < 50
    Faucet.create(
        name: "Robinet n°#{i}",
        manufacturing_date: Time.now,
    )
  else
    Faucet.create(
        name: "Robinet n°#{i}",
        rfid_number: "45678#{i}",
        serial_number: "12345#{i}",
        number_customer_tag: "09876#{i}",
        manufacturing_date: Time.now,
        sales_number: "67890#{i}",
        customer_order_number: "34567#{i}",
        industrial_unit_id: ((i % 10) + 1),
        dn: "000234#{i}"
    )
  end
end

# Maintenance
200.times do |i|
  Event.create(kind: "maintenance", comment: "RAS.", faucet_id: (i % 100) + 1, admin_id: 1, seen: false)
end

# Incident
200.times do |i|
  Event.create(kind: "incident", comment: "Un incident s'est produit sur ce robinet. Après intervention tout est rentré dans l'ordre.", faucet_id: (i % 100) + 1, user_id: 1, seen: false)
end