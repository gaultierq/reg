class Inquiry < ApplicationRecord
  belongs_to :admin, optional: true
  belongs_to :user, optional: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true


  enum theme: { other: 0, inscription: 1 }


end
