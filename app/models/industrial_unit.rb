class IndustrialUnit < ApplicationRecord
  validates :address, presence: true
  validates :postcode, presence: true
  validates :city, presence: true
  validates :country, presence: true

  def full_address
    "#{address}, #{postcode} #{city}, #{country}"
  end
end
