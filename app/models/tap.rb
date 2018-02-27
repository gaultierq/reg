class Tap < ApplicationRecord
  belongs_to :industrial_unit, optional: true

  enum fluid_nature: { liquide: 0, gas: 1 }
  enum fluid_danger_group: { I: 0, II: 1 }, _suffix: true
  enum risk_category: { article_4_3_product: 0, I: 1, II: 2, III: 3, IV: 4 }, _suffix: true
end
