class AddCategToAttachment < ActiveRecord::Migration[5.2]
  def change
    add_column :attachments, :categ, :integer
  end
end
