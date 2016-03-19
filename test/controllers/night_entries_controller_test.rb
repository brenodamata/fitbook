require 'test_helper'

class NightEntriesControllerTest < ActionController::TestCase
  setup do
    @night_entry = night_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:night_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create night_entry" do
    assert_difference('NightEntry.count') do
      post :create, night_entry: { bmi: @night_entry.bmi, bodyfat: @night_entry.bodyfat, calories_burned: @night_entry.calories_burned, weight: @night_entry.weight }
    end

    assert_redirected_to night_entry_path(assigns(:night_entry))
  end

  test "should show night_entry" do
    get :show, id: @night_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @night_entry
    assert_response :success
  end

  test "should update night_entry" do
    patch :update, id: @night_entry, night_entry: { bmi: @night_entry.bmi, bodyfat: @night_entry.bodyfat, calories_burned: @night_entry.calories_burned, weight: @night_entry.weight }
    assert_redirected_to night_entry_path(assigns(:night_entry))
  end

  test "should destroy night_entry" do
    assert_difference('NightEntry.count', -1) do
      delete :destroy, id: @night_entry
    end

    assert_redirected_to night_entries_path
  end
end
