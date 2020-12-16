class Inquiry < ApplicationRecord
  belongs_to :admin, optional: true
  belongs_to :user, optional: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }


  enum theme: { other: 0, inscription: 1 }


end
