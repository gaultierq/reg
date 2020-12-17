class Admin < ApplicationRecord
  include DeviseInvitable::Inviter

  devise :two_factor_authenticatable, :database_authenticatable, :recoverable,
         :rememberable, :timeoutable, :trackable, :validatable, :invitable, :lockable

  has_many :admin_industrial_units
  has_many :industrial_units, through: :admin_industrial_units, dependent: :destroy
  has_many :faucets, through: :industrial_units
  has_many :events

  enum kind: { salesman: 0, administrator: 1 }

  has_one_time_password(encrypted: true)

  scope :salesman, -> { where(kind: :salesman) }
  scope :administrator, -> { where(kind: :administrator) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def send_two_factor_authentication_code(code)
    AdminMailer.otp_email(self, code).deliver_now
  end

  def timeout_in
    1.day
  end

  def inactive
    sign_in_count == 0 && invitation_sent_at.present? && !invitation_accepted_at.present?
  end

  # def need_two_factor_authentication?(request)
  #   request.ip != '127.0.0.1'
  # end

  def is_locked?
    access_locked? || max_login_attempts?
  end

end
