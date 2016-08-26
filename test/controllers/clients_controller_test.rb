require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  include RequireAuthentication

  def update_unexisting_client
    put :update, dni: '28684242', client: {
      name: 'ceci',
      zone_id: zones(:sur),
      address: 'house 123',
      phone: '4555555'
    }
  end

  test 'update existing client' do
    john = clients :john
    put :update, dni: john.dni, client: {name: 'pepe'}
    assert john.reload.name == 'pepe'
  end

  test 'should create unexisting client' do
    assert_difference 'Client.count' do
      update_unexisting_client
    end
  end

  test 'redirect to visit new form' do
    update_unexisting_client
    assert_redirected_to(new_client_visit_path('28684242'))
  end

  test 'client edit form' do
    get :edit, dni: '33333333'
    assert_response :success
  end

  test 'client new form' do
    get :new
    assert_response :success
  end
end
