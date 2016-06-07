require 'test_helper'

class ParLevelsControllerTest < ActionController::TestCase
  setup do
    @par_level = par_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:par_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create par_level" do
    assert_difference('ParLevel.count') do
      post :create, par_level: { day: @par_level.day, parlevel: @par_level.parlevel, product: @par_level.product, truck: @par_level.truck }
    end

    assert_redirected_to par_level_path(assigns(:par_level))
  end

  test "should show par_level" do
    get :show, id: @par_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @par_level
    assert_response :success
  end

  test "should update par_level" do
    patch :update, id: @par_level, par_level: { day: @par_level.day, parlevel: @par_level.parlevel, product: @par_level.product, truck: @par_level.truck }
    assert_redirected_to par_level_path(assigns(:par_level))
  end

  test "should destroy par_level" do
    assert_difference('ParLevel.count', -1) do
      delete :destroy, id: @par_level
    end

    assert_redirected_to par_levels_path
  end
end
