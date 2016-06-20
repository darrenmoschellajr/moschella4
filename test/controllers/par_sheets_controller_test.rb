require 'test_helper'

class ParSheetsControllerTest < ActionController::TestCase
  setup do
    @par_sheet = par_sheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:par_sheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create par_sheet" do
    assert_difference('ParSheet.count') do
      post :create, par_sheet: { day: @par_sheet.day, truck_id: @par_sheet.truck_id }
    end

    assert_redirected_to par_sheet_path(assigns(:par_sheet))
  end

  test "should show par_sheet" do
    get :show, id: @par_sheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @par_sheet
    assert_response :success
  end

  test "should update par_sheet" do
    patch :update, id: @par_sheet, par_sheet: { day: @par_sheet.day, truck_id: @par_sheet.truck_id }
    assert_redirected_to par_sheet_path(assigns(:par_sheet))
  end

  test "should destroy par_sheet" do
    assert_difference('ParSheet.count', -1) do
      delete :destroy, id: @par_sheet
    end

    assert_redirected_to par_sheets_path
  end
end
