require 'test_helper'

class SupplementCategoriesControllerTest < ActionController::TestCase
  setup do
    @supplement_category = supplement_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supplement_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supplement_category" do
    assert_difference('SupplementCategory.count') do
      post :create, supplement_category: { name: @supplement_category.name }
    end

    assert_redirected_to supplement_category_path(assigns(:supplement_category))
  end

  test "should show supplement_category" do
    get :show, id: @supplement_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supplement_category
    assert_response :success
  end

  test "should update supplement_category" do
    patch :update, id: @supplement_category, supplement_category: { name: @supplement_category.name }
    assert_redirected_to supplement_category_path(assigns(:supplement_category))
  end

  test "should destroy supplement_category" do
    assert_difference('SupplementCategory.count', -1) do
      delete :destroy, id: @supplement_category
    end

    assert_redirected_to supplement_categories_path
  end
end
