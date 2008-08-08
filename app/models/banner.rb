class Banner < ActiveRecord::Base
  belongs_to :image, :dependent => :destroy

  validates_presence_of :owner, :start_at, :end_at, :image
  validates_associated :image

  def image_file=(file_field)
    return if file_field.original_filename.blank?

    image.destroy if image
    build_image(:content_type => file_field.content_type.chomp, :data => file_field.read)
  end
end
