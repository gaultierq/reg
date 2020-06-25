class AddTemplateNameToTapTemplates < ActiveRecord::Migration[5.2]
  def change
    add_column :tap_templates, :template_name, :string, null: false, default: ""
  end
end
