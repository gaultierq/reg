class Event < ApplicationRecord
  belongs_to :faucet

  enum kind: { maintenance: 0, incident: 1 }
end
