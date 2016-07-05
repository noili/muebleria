require 'test_helper'

class AdminFlowTest < ActionDispatch::IntegrationTest

  SAMPLE_CLIENT = {
    client_name: 'John Doe',
    client_address: '25 de Mayo 2445 piso 2 dpto 3',
    client_cellphone: '155-325565'
  }

  test 'adding a new visit for a new client' do
    dni = '302020202'
    visit '/'
    page
    assert_current_path new_session_path
    fill_in :email, with: users(:admin).email
    fill_in :password, with: 'secret'
    click_on 'Iniciar'
    assert_current_path new_client_path
    fill_in 'Buscar DNI', with: dni
    click_on 'Search'
    assert_current_path clients_path
    SAMPLE_CLIENT.each do |attr, value|
      fill_in attr, with: value
    end
    click_on 'Guardar'
    assert_current_path new_client_visit_path(dni)
    fill_in :visit_description, with: 'una cama'
    fill_in :visit_duration, with: '2'
    select Turn.last.to_s, from: 'Turno'
    click_on 'Guardar'
    assert_current_path visit_path(Visit.last)
  end
end
