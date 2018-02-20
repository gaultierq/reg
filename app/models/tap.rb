class Tap < ApplicationRecord
  belongs_to :industrial_unit, optional: true
end
