class FaucetAttachment < ApplicationRecord
  belongs_to :faucet
  belongs_to :attachment
end
