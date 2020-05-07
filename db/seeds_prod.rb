
Admin.create(first_name: "Florent", last_name: "Beaurain", email: "beaurain.florent@protonmail.com",
             phone_number: FFaker::PhoneNumberFR.unique.phone_number, password: "password", password_confirmation: "password", kind: "administrator")

Admin.create(first_name: "Quentin", last_name: "Gaultier", email: "quentin.gaultier@gmail.com",
             phone_number: FFaker::PhoneNumberFR.unique.phone_number, password: "password", password_confirmation: "password", kind: "administrator")

