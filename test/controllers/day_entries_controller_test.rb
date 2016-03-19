require 'test_helper'

class DayEntriesControllerTest < ActionController::TestCase
  setup do
    @day_entry = day_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:day_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create day_entry" do
    assert_difference('DayEntry.count') do
      post :create, day_entry: { bmi: @day_entry.bmi, bodyfat: @day_entry.bodyfat, minutes_of_sleep: @day_entry.minutes_of_sleep, weight: @day_entry.weight }
    end

    assert_redirected_to day_entry_path(assigns(:day_entry))
  end

  test "should show day_entry" do
    get :show, id: @day_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @day_entry
    assert_response :success
  end

  test "should update day_entry" do
    patch :update, id: @day_entry, day_entry: { bmi: @day_entry.bmi, bodyfat: @day_entry.bodyfat, minutes_of_sleep: @day_entry.minutes_of_sleep, weight: @day_entry.weight }
    assert_redirected_to day_entry_path(assigns(:day_entry))
  end

  test "should destroy day_entry" do
    assert_difference('DayEntry.count', -1) do
      delete :destroy, id: @day_entry
    end

    assert_redirected_to day_entries_path
  end
end
