class Alert < ApplicationRecord
  belongs_to :industrial_unit
  belongs_to :faucet

  enum kind: { maintenance: 0, incident: 1 }
end
