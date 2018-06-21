class AddMd5ToAttachment < ActiveRecord::Migration[5.2]
  def change
    add_column :attachments, :md5, :string
  end
end
