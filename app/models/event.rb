class Event < ApplicationRecord

  belongs_to :faucet
  validate :faucet_with_industrial_unit?


  belongs_to :admin, optional: true
  belongs_to :user, optional: true

  has_many :event_attachments
  has_many :attachments, through: :event_attachments, dependent: :destroy

  enum kind: { maintenance: 0, incident: 1 }


  def faucet_with_industrial_unit?
    errors.add(:faucet, "cannot create a event on a faucet without industrial unit") unless faucet&.industrial_unit.present?
  end

end
