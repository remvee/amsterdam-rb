class Banner < ActiveRecord::Base
  belongs_to :image, :dependent => :destroy

  named_scope :current, proc {
    {:order => 'start_at', :conditions => ['start_at <= :now AND end_at >= :now', {:now => Time.now}]}
  }

  validates_presence_of :owner, :start_at, :end_at, :image
  validates_associated :image

  def image_file=(file_field)
    return if file_field.blank?

    image.destroy if image
    build_image(:content_type => file_field.content_type.chomp, :data => file_field.read)
  end
end
