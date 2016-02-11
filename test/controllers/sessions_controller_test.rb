require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "show the login form" do
    get :new
    assert_response :success
  end

  test "with valid credentials sign the user in" do
    post :create, email: users(:admin).email,
                  password: 'secret'
    assert_equal users(:admin).id, session[:user_id]
    assert_redirected_to new_client_path
    assert_equal 'Iniciaste sesion correctamente', flash[:notice]
  end

  test "should get delete" do
    session[:user_id] = users(:admin).id
    delete :destroy
    assert_nil session[:user_id]
  end

end
