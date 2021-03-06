class Banner < ActiveRecord::Base
  belongs_to :image, :dependent => :destroy

  named_scope :current, proc {
    {:order => 'start_at', :conditions => ['start_at <= :now AND end_at >= :now', {:now => Time.now}]}
  }

  default_value_for(:start_at) { Time.now }
  default_value_for(:end_at) { 6.months.from_now }

  validates_presence_of :owner, :link, :start_at, :end_at, :image
  validates_associated :image
  validates_format_of :link, :with => %r{^https?://}

  def image_file=(file_field)
    return if file_field.blank?

    image.destroy if image
    build_image(:content_type => file_field.content_type.chomp, :data => file_field.read)
  end
end
