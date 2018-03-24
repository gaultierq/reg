class UserIndustrialUnit < ApplicationRecord
  belongs_to :user
  belongs_to :industrial_unit
end
