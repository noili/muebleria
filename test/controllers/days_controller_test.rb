require 'test_helper'

class DaysControllerTest < ActionController::TestCase
  include RequireAuthentication

  test "should get index" do
    get :index
    assert_response :success
  end
end
