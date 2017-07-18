require 'test_helper'

class UserMoodsControllerTest < ActionController::TestCase
  setup do
    @user_mood = user_moods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_moods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_mood" do
    assert_difference('UserMood.count') do
      post :create, user_mood: { mood_id: @user_mood.mood_id, user_id: @user_mood.user_id }
    end

    assert_redirected_to user_mood_path(assigns(:user_mood))
  end

  test "should show user_mood" do
    get :show, id: @user_mood
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_mood
    assert_response :success
  end

  test "should update user_mood" do
    patch :update, id: @user_mood, user_mood: { mood_id: @user_mood.mood_id, user_id: @user_mood.user_id }
    assert_redirected_to user_mood_path(assigns(:user_mood))
  end

  test "should destroy user_mood" do
    assert_difference('UserMood.count', -1) do
      delete :destroy, id: @user_mood
    end

    assert_redirected_to user_moods_path
  end
end
