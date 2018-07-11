class EventAttachment < ApplicationRecord
  belongs_to :event
  belongs_to :attachment
end
