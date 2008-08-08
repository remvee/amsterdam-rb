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
      assert Banner.create(:owner => 'test', :start_at => Time.now, :end_at => 1.week.from_now, :image_file => mock_image_file)
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

private
  def mock_image_file
    mock(:original_filename => 'banner.gif',
         :content_type => 'image/gif',
         :read => 'image-data')
  end
end
