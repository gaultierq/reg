class User < ApplicationRecord
  include DeviseInvitable::Inviter
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :timeoutable, :trackable, :validatable, :invitable

  has_many :user_industrial_units
  has_many :industrial_units, through: :user_industrial_units, dependent: :destroy
  has_many :faucets, through: :industrial_units
  has_many :events

  enum kind: { technician: 0, client: 1 }

  scope :technician, -> { where(kind: :technician) }
  scope :client, -> { where(kind: :client) }

  def full_name
    "#{first_name} #{last_name}"
  end

  # after 30min without activity
  def timeout_in
    30.minutes
  end


end
