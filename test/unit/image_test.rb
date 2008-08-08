require File.dirname(__FILE__) + '/../test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_fixtures_valid
    Image.all.each do |image|
      assert_valid image
    end
  end

  def test_format_extension_should_know_gif_jpeg_and_png
    Image::EXTENSIONS_BY_TYPE.each do |type,ext|
      assert_equal ext, Image.new(:content_type => type).format_extension
    end
  end

  def test_validate_content_type_handle_only_known_types
    Image::EXTENSIONS_BY_TYPE.keys.each do |type|
      assert images(:one).update_attributes(:content_type => type)
    end

    assert !images(:one).update_attributes(:content_type => 'foo/bar')
    assert_not_nil images(:one).errors.on(:content_type)
  end
end
