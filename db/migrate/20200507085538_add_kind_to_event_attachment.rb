class AddKindToEventAttachment < ActiveRecord::Migration[5.2]
  def change
    add_column :event_attachments, :kind, :integer
  end
end
