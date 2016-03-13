require 'test_helper'

class TurnsControllerTest < ActionController::TestCase
  include RequireAuthentication

  setup do
    @turn = turns(:jueves)
  end

  test "should create turn" do
    assert_difference('Turn.count') do
      post :create, turn: { at: Date.tomorrow, employee_id: employees(:pablo) }
    end

    assert_redirected_to turn_path(assigns(:turn))
  end

  test "should show turn" do
    get :show, id: @turn
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @turn
    assert_response :success
  end

  test "should update turn" do
    patch :update, id: @turn, turn: { at: @turn.at }
    assert_redirected_to turn_path(assigns(:turn))
  end

  test "should destroy turn" do
    assert_difference('Turn.count', -1) do
      delete :destroy, id: @turn
    end

    assert_redirected_to turns_path
  end
end
