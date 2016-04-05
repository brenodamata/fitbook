require 'test_helper'

class NutritionItemsControllerTest < ActionController::TestCase
  setup do
    @nutrition_item = nutrition_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nutrition_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nutrition_item" do
    assert_difference('NutritionItem.count') do
      post :create, nutrition_item: { name: @nutrition_item.name, unit_of_measure: @nutrition_item.unit_of_measure }
    end

    assert_redirected_to nutrition_item_path(assigns(:nutrition_item))
  end

  test "should show nutrition_item" do
    get :show, id: @nutrition_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nutrition_item
    assert_response :success
  end

  test "should update nutrition_item" do
    patch :update, id: @nutrition_item, nutrition_item: { name: @nutrition_item.name, unit_of_measure: @nutrition_item.unit_of_measure }
    assert_redirected_to nutrition_item_path(assigns(:nutrition_item))
  end

  test "should destroy nutrition_item" do
    assert_difference('NutritionItem.count', -1) do
      delete :destroy, id: @nutrition_item
    end

    assert_redirected_to nutrition_items_path
  end
end
