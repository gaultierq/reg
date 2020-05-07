class EventAttachment < ApplicationRecord
  belongs_to :event
  belongs_to :attachment

  validates :kind, presence: true

  enum kind: {
      incident_maintenance: 0,
  }


end
