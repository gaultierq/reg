class User < ApplicationRecord
  include DeviseInvitable::Inviter
  devise :two_factor_authenticatable, :database_authenticatable, :registerable, :recoverable, :rememberable,
         :timeoutable, :trackable, :validatable, :invitable, :lockable

  has_many :user_industrial_units
  has_many :industrial_units, through: :user_industrial_units, dependent: :destroy
  has_many :faucets, through: :industrial_units
  has_many :events

  enum kind: { technician: 0, client: 1 }

  has_one_time_password(encrypted: true)

  scope :technician, -> { where(kind: :technician) }
  scope :client, -> { where(kind: :client) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def send_two_factor_authentication_code(code)
    UserMailer.otp_email(self, code).deliver_now
  end

  # after 30min without activity
  def timeout_in
    1.hours
  end

  def inactive
    sign_in_count == 0 && invitation_sent_at.present? && !invitation_accepted_at.present?
  end

  def is_locked?
    access_locked?
  end

  def is_in_range?(lat, lng)
    industrial_units.any? { |iu| iu.has_in_range?(lat, lng) }
  end
end
