class Attachment < ApplicationRecord
  has_one_attached :pdf

  has_many :faucet_attachments
  has_many :faucets, through: :faucet_attachments, dependent: :destroy
  has_many :tap_template_attachments
  has_many :tap_templates, through: :tap_template_attachments, dependent: :destroy
  has_many :event_attachments
  has_many :events, through: :event_attachments, dependent: :destroy

  enum kind: {
    instruction_service: 0,
    instrumentation_position: 1,
    instrumentation_pilotage: 2,
    instrumentation_autre: 3,
    actionnement_actionneur: 4,
    incident_maintenance: 5,
    open_position: 6,
    close_position: 7,
    certif_corps: 8,
    certif_chapeau: 9,
    certif_tige: 10,
    certif_clapet: 11,
    certif_siege: 12,
    certif_autre: 13,
    special_requirement: 14,
    control: 15,
    documentation_plan: 16
  }

  before_validation :compute_hash

  validates :name, uniqueness: { message: ': Un fichier avec ce nom existe déjà' }
  validates :md5, uniqueness: { message: ': Ce fichier existe déjà' }


  def displayable_kind
    case self.kind
      when 'instruction_service'; "Instructions de service"
      when 'instrumentation_position'; "Détection position"
      when 'instrumentation_pilotage'; "Pilotage"
      when 'instrumentation_autre'; "Autre instrumentation"
      when 'actionnement_actionneur'; "Actionneur"
      when 'incident_maintenance'; "incident_maintenance"
      when 'open_position'; "open_position"
      when 'close_position'; "close_position"
      when 'certif_corps'; "Certificat matière"
      when 'certif_chapeau'; "certif_chapeau"
      when 'certif_tige'; "certif_tige"
      when 'certif_clapet'; "certif_clapet"
      when 'certif_siege'; "certif_siege"
      when 'certif_autre'; "certif_autre"
      when 'special_requirement'; "Exigences particulières"
      when 'control'; "Contrôle"
      when 'documentation_plan'; "Plans"
      else
        "idk"
    end
  end

  private

  def compute_hash
    self.name = pdf.blob.filename
    self.md5 = pdf.blob.checksum
  end


end
