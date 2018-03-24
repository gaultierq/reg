class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable,
         :timeoutable, :trackable, :validatable

  has_many :user_industrial_units
  has_many :industrial_units, through: :user_industrial_units, dependent: :destroy
  has_many :taps, through: :industrial_units

  enum kind: { technician: 0, client: 1 }
end
