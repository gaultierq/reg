class Event < ApplicationRecord
  belongs_to :tap

  enum kind: { maintenance: 0, incident: 1 }
end
