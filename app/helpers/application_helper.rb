module ApplicationHelper
  def attachment_safe_url(attachment)
    return attachment if attachment.class == String
    return image_path 'default.jpg' if attachment.nil?
    # return image_path 'default.jpg' unless attachment.blob.present?
  end
end
