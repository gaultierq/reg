class Alert < ApplicationRecord
  belongs_to :industrial_unit
  belongs_to :faucet
end
