class Admin < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable,
         :timeoutable, :trackable, :validatable

  enum kind: { salesman: 0, administrator: 1 }
end
