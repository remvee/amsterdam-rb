require File.dirname(__FILE__) + '/../test_helper'

class BannersControllerTest < ActionController::TestCase
  def test_index_should_render_table_of_banners
    get :index
    assert_response :success
    assert_select 'table tbody tr'
  end

  def test_new_should_render_form
    get :new
    assert_response :success
    assert_select 'form input[name=?]', 'banner[owner]'
    assert assigns(:banner).new_record?
  end

  def test_create_should_create_new_banner
    assert_difference 'Banner.count + Image.count', 2 do
      post :create, :banner => {:owner => 'test', :link => 'http://test.net/', :start_at => Time.now, :end_at => 1.week.from_now, :image_file => fixture_file_upload('banner-test.gif', 'image/gif')}
      assert_response :redirect
    end
  end

  def test_create_with_error_should_not_create_new_banner
    assert_no_difference 'Banner.count + Image.count' do
      post :create
      assert_response :success
      assert_select '.error_message'
    end
  end

  def test_edit_should_render_form_for_fixtures
    get :edit, :id => banners(:one).id
    assert_response :success
    assert_select 'form input[name=?][value=?]', 'banner[owner]', banners(:one).owner
    assert_equal banners(:one), assigns(:banner)
  end

  def test_update_should_update_fixture
    assert_no_difference 'Banner.count + Image.count' do
      post :update, :id => banners(:one).id, :banner => {:owner => 'test', :start_at => Time.now, :end_at => 1.week.from_now, :image_file => fixture_file_upload('banner-test.gif', 'image/gif')}
      assert_response :redirect
      assert_equal 'test', banners(:one).reload.owner
    end
  end

  def test_update_should_without_image_should_update_fixture
    assert_no_difference 'Banner.count + Image.count' do
      post :update, :id => banners(:one).id, :banner => {:owner => 'test', :start_at => Time.now, :end_at => 1.week.from_now}
      assert_response :redirect
      assert_equal 'test', banners(:one).reload.owner
    end
  end

  def test_update_with_error_should_not_update_fixture
    assert_no_difference 'Banner.count + Image.count' do
      post :update, :id => banners(:one).id, :banner => {:owner => 'test', :start_at => nil}
      assert_response :success
      assert_not_equal 'test', banners(:one).reload.owner
      assert_select '.error_message'
    end
  end

  def test_destroy_should_delete_banner_and_image
    assert_difference 'Banner.count + Image.count', -2 do
      delete :destroy, :id => banners(:one)
      assert_response :redirect
    end
  end
end
