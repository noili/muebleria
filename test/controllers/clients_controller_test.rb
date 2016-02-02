require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  test "update existing client" do
    john = clients :john
    put :update, dni: john.dni, client: {name: 'pepe'}
    assert john.reload.name == 'pepe'
  end

  test "should create unexisting client" do
    assert_difference 'Client.count' do
      put :update, dni: '35353535', client: {name: 'ceci'}
    end
  end
end
