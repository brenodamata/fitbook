require 'test_helper'

class SupplementSubCategoriesControllerTest < ActionController::TestCase
  setup do
    @supplement_sub_category = supplement_sub_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supplement_sub_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supplement_sub_category" do
    assert_difference('SupplementSubCategory.count') do
      post :create, supplement_sub_category: { name: @supplement_sub_category.name, supplement_category_id: @supplement_sub_category.supplement_category_id }
    end

    assert_redirected_to supplement_sub_category_path(assigns(:supplement_sub_category))
  end

  test "should show supplement_sub_category" do
    get :show, id: @supplement_sub_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supplement_sub_category
    assert_response :success
  end

  test "should update supplement_sub_category" do
    patch :update, id: @supplement_sub_category, supplement_sub_category: { name: @supplement_sub_category.name, supplement_category_id: @supplement_sub_category.supplement_category_id }
    assert_redirected_to supplement_sub_category_path(assigns(:supplement_sub_category))
  end

  test "should destroy supplement_sub_category" do
    assert_difference('SupplementSubCategory.count', -1) do
      delete :destroy, id: @supplement_sub_category
    end

    assert_redirected_to supplement_sub_categories_path
  end
end
