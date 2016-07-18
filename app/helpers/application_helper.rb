module ApplicationHelper

  def alert_for(flash_type)
    {
      :success => 'alert-success',
      :error => 'alert-danger',
      :alert => 'alert-warning',
      :notice => 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end
  # The above helper method assigns proper BOOTSTRAP classes according to the
  # type of FLASH notification messages.

  def form_image_select(post)
    return image_tag post.image.url(:medium),
                     id: 'image-preview',
                     class: 'img-responsive' if post.image.exists?
    image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
  end
  # This method is called in our form partial.  It determines whether the @post
  # we're referring to has an image or not.  If it does have an image then we
  # display that image, along with the associated id and class.  If it does NOT
  # have an image, we display placeholder.jpg, which is in our app/assets/images
  # directory.
end
