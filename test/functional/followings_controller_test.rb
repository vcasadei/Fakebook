require 'test_helper'

class FollowingsControllerTest < ActionController::TestCase
  setup do
    @following = followings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:followings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create following" do
    assert_difference('Following.count') do
      post :create, following: { accepted: @following.accepted, blocked: @following.blocked }
    end

    assert_redirected_to following_path(assigns(:following))
  end

  test "should show following" do
    get :show, id: @following
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @following
    assert_response :success
  end

  test "should update following" do
    put :update, id: @following, following: { accepted: @following.accepted, blocked: @following.blocked }
    assert_redirected_to following_path(assigns(:following))
  end

  test "should destroy following" do
    assert_difference('Following.count', -1) do
      delete :destroy, id: @following
    end

    assert_redirected_to followings_path
  end
end
