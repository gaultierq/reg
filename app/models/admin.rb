class Admin < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable,
         :timeoutable, :trackable, :validatable
end
