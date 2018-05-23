class CreateTapTemplateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :tap_template_attachments do |t|
      t.references :tap_template, foreign_key: true
      t.references :attachment, foreign_key: true

      t.timestamps
    end
  end
end
