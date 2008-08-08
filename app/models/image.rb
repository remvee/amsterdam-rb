class Image < ActiveRecord::Base
  EXTENSIONS_BY_TYPE = {
    'image/gif'  => 'gif',
    'image/jpeg' => 'jpg',
    'image/png'  => 'png'
  }

  validates_presence_of :content_type, :data
  validates_inclusion_of :content_type, :in => EXTENSIONS_BY_TYPE.keys

  def format_extension
    EXTENSIONS_BY_TYPE[content_type]
  end
end
