require 'test_helper'

class TurnsControllerTest < ActionController::TestCase
  include RequireAuthentication

  setup do
    @turn = turns(:jueves)
  end

  test "should show a calendar displaying any turns" do
    get :index
    assert_response :success
    assert assigns(:calendar)
  end

  test "should show turn" do
    get :show, id: @turn
    assert_response :success
  end
end
