class Tap < ApplicationRecord
  include Filterable

  belongs_to :industrial_unit, optional: true
  has_many :events, dependent: :destroy

  scope :industrial_unit, -> (industrial_unit_id) { where(industrial_unit_id: industrial_unit_id) }

  enum fluid_nature: { liquide: 0, gas: 1 }
  enum fluid_danger_group: { I: 0, II: 1 }, _suffix: true
  enum risk_category: { article_4_3_product: 0, I: 1, II: 2, III: 3, IV: 4 }, _suffix: true
end
