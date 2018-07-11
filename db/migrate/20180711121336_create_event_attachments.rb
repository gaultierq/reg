class CreateEventAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :event_attachments do |t|
      t.references :event, foreign_key: true
      t.references :attachment, foreign_key: true

      t.timestamps
    end
  end
end
