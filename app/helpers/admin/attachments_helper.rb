module Admin::AttachmentsHelper

  def already_attachment(kind)
    categ = Attachment.get_categ(kind)
    Attachment.where(categ: categ).collect {|attachment| [attachment.pdf.blob.filename, attachment.id] if attachment.pdf.attached?}.compact
  end
end
