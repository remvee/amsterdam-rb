require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  def test_show_should_render_inline_image
    get :show, :id => images(:one)
    assert_response :success
    assert_equal images(:one).content_type, @response.headers['Content-Type']
    assert_equal 'inline', @response.headers['Content-Disposition']
  end
end
