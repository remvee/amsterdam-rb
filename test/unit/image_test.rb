require File.dirname(__FILE__) + '/../test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_fixtures_valid
    Image.all.each do |image|
      assert_valid image
    end
  end
end
