class FaucetAttachment < ApplicationRecord
  belongs_to :faucet
  belongs_to :attachment

  validates :kind, presence: true

  enum kind: {
      instruction_service: 0,
      instrumentation_position: 1,
      instrumentation_pilotage: 2,
      instrumentation_autre: 3,
      actionnement_actionneur: 4,
      incident_maintenance: 5,
      open_position: 6,
      close_position: 7,
      certif_chapeau: 9,
      certif_tige: 10,
      certif_clapet: 11,
      certif_siege: 12,
      certif_autre: 13,
      special_requirement: 14,
      control: 15,
      documentation_plan: 16
  }


end
