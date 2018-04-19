class IndustrialUnit < ApplicationRecord
  has_many :user_industrial_units
  has_many :users, through: :user_industrial_units, dependent: :destroy
  has_many :admin_industrial_units
  has_many :admins, through: :admin_industrial_units, dependent: :destroy
  has_many :faucets, dependent: :destroy

  validates :address, presence: true
  validates :postcode, presence: true
  validates :city, presence: true
  validates :country, presence: true

  accepts_nested_attributes_for :user_industrial_units
  accepts_nested_attributes_for :admin_industrial_units
  
  def full_address
    "#{address}, #{postcode} #{city}, #{country}"
  end
end
