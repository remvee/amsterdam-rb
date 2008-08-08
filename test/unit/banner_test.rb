require File.dirname(__FILE__) + '/../test_helper'
require 'mocha'

class BannerTest < ActiveSupport::TestCase
  def test_fixtures_valid
    Banner.all.each do |banner|
      assert_valid banner
    end
  end

  def test_create_with_image_file
    assert_difference('Image.count') do
      assert Banner.create(:owner => 'test', :link => 'http://test.net', :start_at => Time.now, :end_at => 1.week.from_now, :image_file => mock_image_file)
    end
  end

  def test_update_with_image_file
    assert_no_difference('Image.count') do
      before = banners(:one).image.id
      assert banners(:one).update_attributes(:image_file => mock_image_file)
      banners(:one).reload
      assert_not_equal before, banners(:one).image.id
    end
  end

  def test_destroy_should_also_destroy_image
    assert_difference 'Image.count', -1 do
      banners(:one).destroy
    end
  end

  def test_current_scope
    (banners(:one).start_at + 1.hour).warp do
      assert Banner.current.include?(banners(:one)), 'expected inclusion of banner one'
    end
    (banners(:one).end_at - 1.hour).warp do
      assert Banner.current.include?(banners(:one)), 'expected inclusion of banner one'
    end
    (banners(:one).start_at - 1.hour).warp do
      assert !Banner.current.include?(banners(:one)), 'unexpected inclusion of banner one'
    end
    (banners(:one).end_at + 1.hour).warp do
      assert !Banner.current.include?(banners(:one)), 'unexpected inclusion of banner one'
    end
  end

private
  def mock_image_file
    mock(:content_type => 'image/gif', :read => 'image-data')
  end
end
