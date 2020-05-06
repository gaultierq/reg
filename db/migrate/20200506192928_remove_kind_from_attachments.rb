class RemoveKindFromAttachments < ActiveRecord::Migration[5.2]
  def change
    remove_column :attachments, :kind, :int
  end
end
