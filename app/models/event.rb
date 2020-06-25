class Event < ApplicationRecord

  belongs_to :faucet
  validate :faucet_with_industrial_unit?

  belongs_to :admin, optional: true
  belongs_to :user, optional: true

  # has_one :user

  has_many :event_attachments
  has_many :attachments, :extend => Kindable, through: :event_attachments, dependent: :destroy do

    def where_kind(kind)
      kind = EventAttachment.kinds[kind] if kind.kind_of? Symbol
      where("event_attachments.kind = ?", kind)
    end
  end

  enum kind: { maintenance: 0, incident: 1 }


  def faucet_with_industrial_unit?
    errors.add(:faucet, "cannot create a event on a faucet without industrial unit") unless faucet&.industrial_unit.present?
  end

end
