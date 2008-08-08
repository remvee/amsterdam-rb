class Image < ActiveRecord::Base
  validates_presence_of :content_type, :data
end
