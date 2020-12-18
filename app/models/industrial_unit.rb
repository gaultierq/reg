class IndustrialUnit < ApplicationRecord
  require 'browser'

  include Filterable

  acts_as_mappable default_units: :kms, lat_column_name: :latitude,
                   lng_column_name: :longitude

  has_many :user_industrial_units
  has_many :users, through: :user_industrial_units, dependent: :destroy
  has_many :admin_industrial_units
  has_many :admins, through: :admin_industrial_units, dependent: :destroy
  has_many :faucets, dependent: :destroy

  # validates :address, presence: true
  # validates :postcode, presence: true
  # validates :city, presence: true
  # validates :country, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  scope :industrial_unit, -> (industrial_unit_id) { where(id: industrial_unit_id) }

  accepts_nested_attributes_for :user_industrial_units
  accepts_nested_attributes_for :admin_industrial_units

  def self.to_csv
    attributes = %w{ Nom N°\ puce\ RFID N°\ série\ REG N°\ TAG\ client Date\ de\ fabrication N°\ vente\ REG
        N°\ commande\ client N°\ article Unité\ industrielle DN Raccordement\ entrée Raccordement\ sortie
        Raccordement\ de\ double\ enveloppe Inclinaison/décalage\ entrée/sortie Face\ à\ face
        Pression\ Maximale\ (PS)\ à\ 20°C\ (bar) Pression\ d'épreuve\ à\ 20°C\ (bar) Température\ maximum\ (°C)
        Pression\ à\ la\ température\ maximum\ (bar) Température\ minimum\ (°C) Pression\ à\ la\ température\ minimum\ (bar)
        Nom\ du\ fluide Pression\ (bar) Température\ (°C) Nature\ du\ fluide Groupe\ de\ danger\ du\ fluide
        Gaz\ instable Catégorie\ de\ risque\ selon\ DESP\ 2014/68/UE Commande\ manuelle Actionneur
        Pression\ actionneur\ pneumatique Détecteur\ de\ position Position\ ouverte Position\ fermée Pilotage
        Autres\ instrumentation Enveloppe Double\ enveloppe Obturateur\ (partie\ mobile) Siège\ (partie\ fixe)
        Garniture\ de\ presse\ étoupe Joints Certificats\ matières\ demandés ATEX Autres\ exigences\ particulières
        Autres\ contrôles Autres }

    CSV.generate(headers: true, col_sep: ';', encoding: 'ISO-8859-1') do |csv|
      csv << attributes

      all.each do |industrial_unit|
        industrial_unit.faucets.each do |faucet|
        csv << [faucet.name, faucet.rfid_number, faucet.serial_number, faucet.number_customer_tag,
                faucet.manufacturing_date, faucet.sales_number, faucet.customer_order_number,
                faucet.article_number, faucet.industrial_unit&.name, faucet.dn,
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

  def to_csv
    attributes = %w{ Nom N°\ puce\ RFID N°\ série\ REG N°\ TAG\ client Date\ de\ fabrication N°\ vente\ REG
        N°\ commande\ client N°\ article Unité\ industrielle DN Raccordement\ entrée Raccordement\ sortie
        Raccordement\ de\ double\ enveloppe Inclinaison/décalage\ entrée/sortie Face\ à\ face
        Pression\ Maximale\ (PS)\ à\ 20°C\ (bar) Pression\ d'épreuve\ à\ 20°C\ (bar) Température\ maximum\ (°C)
        Pression\ à\ la\ température\ maximum\ (bar) Température\ minimum\ (°C) Pression\ à\ la\ température\ minimum\ (bar)
        Nom\ du\ fluide Pression\ (bar) Température\ (°C) Nature\ du\ fluide Groupe\ de\ danger\ du\ fluide
        Gaz\ instable Catégorie\ de\ risque\ selon\ DESP\ 2014/68/UE Commande\ manuelle Actionneur
        Pression\ actionneur\ pneumatique Détecteur\ de\ position Position\ ouverte Position\ fermée Pilotage
        Autres\ instrumentation Enveloppe Double\ enveloppe Obturateur\ (partie\ mobile) Siège\ (partie\ fixe)
        Garniture\ de\ presse\ étoupe Joints Certificats\ matières\ demandés ATEX Autres\ exigences\ particulières
        Autres\ contrôles Autres }

    CSV.generate(headers: true, col_sep: ';', encoding: 'ISO-8859-1') do |csv|
      csv << attributes

      self.faucets.each do |faucet|
        csv << [faucet.name, faucet.rfid_number, faucet.serial_number, faucet.number_customer_tag,
                faucet.manufacturing_date, faucet.sales_number, faucet.customer_order_number,
                faucet.article_number, faucet.industrial_unit&.name, faucet.dn,
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

  def full_address
    "#{address}, #{postcode} #{city}, #{country}"
  end

  def has_in_range?(lat, lng)
    left = Geokit::LatLng.new(latitude, longitude)
    right = Geokit::LatLng.new(lat, lng)
    dist = left.distance_to(right)
    puts "dist=#{dist}"
    dist < sign_in_perimeter
  end
end
