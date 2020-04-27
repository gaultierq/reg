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
    Attachment.displayable_kind(self.kind)
  end

  def self.displayable_kind(k)
    I18n.t("attachment_kind.#{k}")
  end

  private

  def compute_hash
    self.name = pdf.blob.filename
    self.md5 = pdf.blob.checksum
  end

  def self.prepare_attach(params)
    attachments = []
    if params.present?
      Attachment.kinds.each {|kind, i|
        existing = params["existing_#{kind.to_s}_attachment".to_sym]&.reject(&:empty?)

        attachments.concat existing.map {|ex| Attachment.where(id: ex)}.flatten.compact if existing.present?

        new_files = params["new_#{kind.to_s}_attachment".to_sym]

        if new_files.present?
          new_files.each do |attachment|
            attachment_to_add = Attachment.new(kind: kind, pdf: attachment)

            if attachment_to_add.valid?
              # md5 + name are uniq
              attachments << attachment_to_add
            else
              # file already in db, attaching to template
              already = Attachment.find_by(md5: attachment_to_add.md5)
              if already
                attachments << already
              else
                # TODO: handle this case
                puts "Un fichier avec le même nom est déjà présent"
              end
            end
          end
        end
      }

    end
    attachments
  end
end
