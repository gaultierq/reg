class TapTemplate < ApplicationRecord
  has_many :tap_template_attachments
  has_many :attachments, through: :tap_template_attachments, dependent: :destroy

  enum fluid_nature: { liquide: 0, gas: 1 }
  enum fluid_danger_group: { I: 0, II: 1 }, _prefix: true
  enum risk_category: { article_4_3_product: 0, I: 1, II: 2, III: 3, IV: 4 }, _prefix: true
end
