require 'test_helper'

class MeetingsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

  def test_new
    get :new
    assert_response :success
    assert_select 'form'
  end

  def test_edit
    get :edit, :id => meetings(:one).id
    assert_response :success
    assert_select 'form'
  end

  def test_create
    assert_difference 'Meeting.count' do
      post :create, :meeting => {:start_at => Date.today.next_last_monday_of_the_month, :blurp => 'test', :gmaps_url => 'http://example.com'}
      assert_response :redirect
    end
  end

  def test_update
    put :update, :id => meetings(:one).id, :meeting => {:blurp => 'test update'}
    assert_response :redirect
    assert_equal 'test update', meetings(:one).reload.blurp
  end

  def test_destroy
    assert_difference 'Meeting.count', -1 do
      delete :destroy, :id => meetings(:one).id
    end
  end
end
