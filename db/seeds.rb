# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin
Admin.create(first_name: "Florent", last_name: "Beaurain", email: "beaurain.florent@protonmail.com",
             password: "password", password_confirmation: "password", kind: "administrator")

# Salesman
10.times do
  Admin.create(first_name: FFaker::Name.first_name , last_name: FFaker::Name.last_name, email: FFaker::Internet.unique.email,
               password: "password", password_confirmation: "password")
end

# Technician
10.times do
  User.create(first_name: FFaker::Name.first_name , last_name: FFaker::Name.last_name, email: FFaker::Internet.unique.email,
              password: "password", password_confirmation: "password")
end

# Client
10.times do
  User.create(first_name: FFaker::Name.first_name , last_name: FFaker::Name.last_name, email: FFaker::Internet.unique.email,
              password: "password", password_confirmation: "password", kind: "client")
end

# Industrial unit
10.times do
  industrial_unit = IndustrialUnit.create(name: FFaker::Lorem.sentence, address: FFaker::AddressFR.street_address,
                                          city: FFaker::AddressFR.city, postcode: FFaker::AddressFR.postal_code, country: "France")

  UserIndustrialUnit.create(user_id: industrial_unit.id, industrial_unit_id: industrial_unit)
  UserIndustrialUnit.create(user_id: (industrial_unit.id + 10), industrial_unit_id: industrial_unit)
end

# Tap template
10.times do
  TapTemplate.create(name: FFaker::Lorem.sentence)
end

# Tap
100.times do |i|
  if i < 50
    Tap.create(name: FFaker::Lorem.sentence)
  else
    Tap.create(name: FFaker::Lorem.sentence, industrial_unit_id: (i % 10) + 1)
  end
end

# Maintenance
200.times do |i|
  Event.create(kind: "maintenance", tap_id: (i % 100) + 1)
end

# Incident
200.times do |i|
  Event.create(kind: "incident", tap_id: (i % 100) + 1)
end