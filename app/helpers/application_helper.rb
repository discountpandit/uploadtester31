module ApplicationHelper
  
  def session_key_name
    Rails.application.config.session_options[:key]
  end
  
  def gallery_thumbnail(gallery)
    if gallery.images.count > 0
      image_tag(gallery.images.first.asset.url(:square_thumb, false))
    else
      image_tag('/images/pixel.gif', :height => 160)
    end
  end
end
