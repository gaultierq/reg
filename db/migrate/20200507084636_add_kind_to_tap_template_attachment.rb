class AddKindToTapTemplateAttachment < ActiveRecord::Migration[5.2]
  def change
    add_column :tap_template_attachments, :kind, :integer
  end
end
