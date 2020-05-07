class Attachment < ApplicationRecord
  has_one_attached :pdf

  has_many :faucet_attachments
  has_many :faucets, through: :faucet_attachments, dependent: :destroy
  has_many :tap_template_attachments
  has_many :tap_templates, through: :tap_template_attachments, dependent: :destroy
  has_many :event_attachments
  has_many :events, through: :event_attachments, dependent: :destroy

  enum categ: {
      instruction_service: 1,
      instrumentation_position: 2,
      instrumentation_pilotage: 3,
      instrumentation_autre: 4,
      actionnement_actionneur: 5,
      incident_maintenance: 6,
      certif_material: 8,
      special_requirement: 9,
      control: 10,
      documentation_plan: 11
  }

  before_validation :compute_hash

  validates :name, uniqueness: { message: ': Un fichier avec ce nom existe déjà' }
  validates :md5, uniqueness: { message: ': Ce fichier existe déjà' }
  validates :categ, presence: true

  attr_accessor :kind


  def self.get_categ(kind)
    case kind.to_s
      when "certif_corps", "certif_chapeau", "certif_tige","certif_clapet","certif_siege","certif_autre"
        :certif_material
      when "open_position", "close_position"
        :instrument_position
      else
        kind
    end
  end

  private





  def compute_hash
    self.name = pdf.blob.filename
    self.md5 = pdf.blob.checksum
  end

  def self.prepare_attach(params, kinds)
    attachments = []
    if params.present?
      kinds.each {|kind, i|
        existing = params["existing_#{kind.to_s}_attachment".to_sym]&.reject(&:empty?)

        attachments.concat  existing
                                .map {|ex| Attachment.where(id: ex)}
                                .flatten
                                .compact
                                .each { |a| a.kind = kind } if existing.present?

        new_files = params["new_#{kind.to_s}_attachment".to_sym]

        if new_files.present?
          new_files.each do |attachment|
            categ = self.get_categ(kind)

            attachment_to_add = Attachment.new(kind: kind, pdf: attachment, categ: categ)

            if attachment_to_add.valid?
              # md5 + name are uniq
              attachments << attachment_to_add
            else
              # file already in db, attaching to template
              already = Attachment.find_by(md5: attachment_to_add.md5)
              already.kind = kind
              already.categ = categ

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
