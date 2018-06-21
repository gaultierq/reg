class Attachment < ApplicationRecord
  has_one_attached :pdf

  has_many :faucet_attachments
  has_many :faucets, through: :faucet_attachments, dependent: :destroy
  has_many :tap_template_attachments
  has_many :tap_templates, through: :tap_template_attachments, dependent: :destroy

  enum kind: {
    instruction_service: 0,
    instrumentation_position: 1,
    instrumentation_pilotage: 2,
    instrumentation_autre: 3,
    actionnement_actionneur: 4
  }

  before_validation :compute_hash

  validates :md5, uniqueness: { message: 'Ce fichié existe déjà' }

  private

  def compute_hash
    self.md5 = pdf.blob.checksum
  end
end
