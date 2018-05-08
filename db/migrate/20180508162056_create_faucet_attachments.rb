class CreateFaucetAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :faucet_attachments do |t|
      t.references :faucet, foreign_key: true
      t.references :attachment, foreign_key: true

      t.timestamps
    end
  end
end
