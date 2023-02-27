module ApplicationHelper
  def attachment_safe_url(attachment)
    return image_path 'default.jpg' if attachment.nil?
    return image_path 'default.jpg' unless attachment.blob.present?

    case attachment.service.name
    when :cloudinary then cl_image_path attachment.key
    when :amazon     then attachment.url
    else
      image_path 'default.jpg'
    end
  end
end
