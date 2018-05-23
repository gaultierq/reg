class TapTemplateAttachment < ApplicationRecord
  belongs_to :tap_template
  belongs_to :attachment
end
