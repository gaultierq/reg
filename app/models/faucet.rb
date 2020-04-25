class Faucet < ApplicationRecord
  include Filterable

  belongs_to :industrial_unit, optional: true

  has_many :events, dependent: :destroy
  has_many :faucet_attachments
  has_many :attachments, through: :faucet_attachments, dependent: :destroy

  scope :industrial_unit, ->(industrial_unit_id) { where(industrial_unit_id: industrial_unit_id) }
  scope :without_industrial_unit, -> { where('industrial_unit_id is null') }

  enum fluid_nature: { liquide: 0, gas: 1 }
  enum fluid_danger_group: { I: 0, II: 1 }, _suffix: true
  enum risk_category: { article_4_3_product: 0, I: 1, II: 2, III: 3, IV: 4 }, _suffix: true

  validates :serial_number, uniqueness: { message: 'existe déjà' }

  def self.to_csv
    attributes = %w[ Nom N°\ puce\ RFID N°\ série\ REG N°\ TAG\ client Date\ de\ fabrication N°\ vente\ REG
                     N°\ commande\ client N°\ article DN Raccordement\ entrée Raccordement\ sortie
                     Raccordement\ de\ double\ enveloppe Inclinaison/décalage\ entrée/sortie Face\ à\ face
                     Pression\ Maximale\ (PS)\ à\ 20°C\ (bar) Pression\ d'épreuve\ à\ 20°C\ (bar) Température\ maximum\ (°C)
                     Pression\ à\ la\ température\ maximum\ (bar) Température\ minimum\ (°C) Pression\ à\ la\ température\ minimum\ (bar)
                     Nom\ du\ fluide Pression\ (bar) Température\ (°C) Nature\ du\ fluide Groupe\ de\ danger\ du\ fluide
                     Gaz\ instable Catégorie\ de\ risque\ selon\ DESP\ 2014/68 Commande\ manuelle Actionneur
                     Pression\ actionneur\ pneumatique Détecteur\ de\ position Position\ ouverte Position\ fermée Pilotage
                     Autres\ instrumentation Enveloppe Double\ enveloppe Obturateur\ (partie\ mobile) Siège\ (partie\ fixe)
                     Garniture\ de\ presse\ étoupe Joints Certificats\ matières\ demandés ATEX Autres\ exigences\ particulières
                     Autres\ contrôles Autres ]

    CSV.generate(headers: true, col_sep: ';', encoding: 'ISO-8859-1') do |csv|
      csv << attributes

      self.where(industrial_unit: nil).all.each do |faucet|
        csv << [faucet.name, faucet.rfid_number, faucet.serial_number, faucet.number_customer_tag,
                faucet.manufacturing_date, faucet.sales_number, faucet.customer_order_number,
                faucet.article_number, faucet.dn,
                faucet.input_connection, faucet.output_connection, faucet.double_jacket_connection,
                faucet.inclination_input_offset_output, faucet.face_to_face, faucet.maximal_pressure,
                faucet.test_pressure, faucet.maximum_temperature, faucet.pressure_at_maximum_temperature,
                faucet.minimum_temperature, faucet.pressure_at_minimum_temperature, faucet.fluid_name,
                faucet.pressure, faucet.temperature, faucet.fluid_nature, faucet.fluid_danger_group,
                faucet.unstable_gas, faucet.risk_category, faucet.manual_control, faucet.actuator,
                faucet.pneumatic_actuator_pressure, faucet.position_detector, faucet.open_position,
                faucet.close_position, faucet.piloting, faucet.other_instrumentation, faucet.shell,
                faucet.double_shell, faucet.shutter_cover, faucet.seat, faucet.cable_gland_packing,
                faucet.seals, faucet.material_certificates_required, faucet.atex,
                faucet.other_special_requirements, faucet.other_controls, faucet.other]
      end
    end
  end

end
