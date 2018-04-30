class Event < ApplicationRecord
  belongs_to :faucet
  belongs_to :admin, optional: true
  belongs_to :user, optional: true

  enum kind: { maintenance: 0, incident: 1 }
end
