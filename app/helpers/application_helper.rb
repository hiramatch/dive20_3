module ApplicationHelper
  def profile_img(user, size)
   return image_tag(user.avatar, alt: user.name, size: size) if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, alt: user.name, size: size)
  end
end
