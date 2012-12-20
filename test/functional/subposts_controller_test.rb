require 'test_helper'

class SubpostsControllerTest < ActionController::TestCase
  setup do
    @subpost = subposts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subposts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subpost" do
    assert_difference('Subpost.count') do
      post :create, subpost: { file: @subpost.file, message: @subpost.message, post_id: @subpost.post_id, title: @subpost.title, url: @subpost.url, user_id: @subpost.user_id }
    end

    assert_redirected_to subpost_path(assigns(:subpost))
  end

  test "should show subpost" do
    get :show, id: @subpost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subpost
    assert_response :success
  end

  test "should update subpost" do
    put :update, id: @subpost, subpost: { file: @subpost.file, message: @subpost.message, post_id: @subpost.post_id, title: @subpost.title, url: @subpost.url, user_id: @subpost.user_id }
    assert_redirected_to subpost_path(assigns(:subpost))
  end

  test "should destroy subpost" do
    assert_difference('Subpost.count', -1) do
      delete :destroy, id: @subpost
    end

    assert_redirected_to subposts_path
  end
end
