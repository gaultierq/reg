class Admin < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable,
         :timeoutable, :trackable, :validatable, :invitable

  has_many :admin_industrial_units
  has_many :industrial_units, through: :admin_industrial_units, dependent: :destroy
  has_many :faucets, through: :industrial_units

  enum kind: { salesman: 0, administrator: 1 }

  scope :salesman, -> { where(kind: :salesman) }
  scope :administrator, -> { where(kind: :administrator) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
