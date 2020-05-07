class TapTemplateAttachment < ApplicationRecord
  belongs_to :tap_template
  belongs_to :attachment

  enum kind: FaucetAttachment.kinds
end
