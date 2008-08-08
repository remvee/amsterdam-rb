module ImagesHelper
  def show_image_tag(image)
    image_tag "#{image_path(image)}.#{image.format_extension}", :alt => ''
  end
end
