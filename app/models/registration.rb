class Registration < ApplicationRecord
  belongs_to :admin, optional: true
end
