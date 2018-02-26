class IndustrialUnit < ApplicationRecord
  has_many :taps, dependent: :destroy

  validates :address, presence: true
  validates :postcode, presence: true
  validates :city, presence: true
  validates :country, presence: true

  def full_address
    "#{address}, #{postcode} #{city}, #{country}"
  end
end
