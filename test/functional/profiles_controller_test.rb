require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post :create, profile: { about: @profile.about, birthday: @profile.birthday, city: @profile.city, college: @profile.college, contact_email: @profile.contact_email, country: @profile.country, full_name: @profile.full_name, gender: @profile.gender, high_school: @profile.high_school, state: @profile.state, website: @profile.website, work_at: @profile.work_at }
    end

    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should show profile" do
    get :show, id: @profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile
    assert_response :success
  end

  test "should update profile" do
    put :update, id: @profile, profile: { about: @profile.about, birthday: @profile.birthday, city: @profile.city, college: @profile.college, contact_email: @profile.contact_email, country: @profile.country, full_name: @profile.full_name, gender: @profile.gender, high_school: @profile.high_school, state: @profile.state, website: @profile.website, work_at: @profile.work_at }
    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete :destroy, id: @profile
    end

    assert_redirected_to profiles_path
  end
end
