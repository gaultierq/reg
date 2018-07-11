class Event < ApplicationRecord
  belongs_to :faucet
  belongs_to :admin, optional: true
  belongs_to :user, optional: true

  has_many :event_attachments
  has_many :attachments, through: :event_attachments, dependent: :destroy

  enum kind: { maintenance: 0, incident: 1 }
end
