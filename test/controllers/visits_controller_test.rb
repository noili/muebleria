require 'test_helper'

class VisitsControllerTest < ActionController::TestCase
  def client
    clients(:john)
  end

  def valid_visit_data
    { visit: { description: '2 camas', duration: '2', client: client } }
  end

  test 'the visit new form' do
    get :new, client_dni: client.dni
    assert_not_nil assigns(:visit)
    assert_response :success
  end

  test '#new show form for new visit' do
    get :new, client_dni: client.dni
    assert_select 'textarea#visit_description'
    assert_select 'input#visit_duration'
    assert_select 'input[type=submit]'
  end

  test 'should create visit' do
    assert_difference('Visit.count') do
      post :create, visit: valid_visit_data, client_dni: client.dni

      assert_redirected_to visit_path(Visit.last)
    end
  end
end
