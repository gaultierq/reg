class AddKindToFaucetAttachment < ActiveRecord::Migration[5.2]
  def change
    add_column :faucet_attachments, :kind, :integer
  end
end
