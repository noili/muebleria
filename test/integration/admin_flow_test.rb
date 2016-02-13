require 'test_helper'

class AdminFlowTest < ActionDispatch::IntegrationTest

  SAMPLE_CLIENT = {
    name: 'John Doe',
    address: '25 de Mayo 2445 piso 2 dpto 3',
    cellphone: '155-325565'
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
    fill_in 'DNI', with: dni
    click_on 'Search'
    assert_current_path edit_client_path(dni)
    SAMPLE_CLIENT.each do |attr, value|
      fill_in attr.to_s.capitalize, with: value
    end
    click_on 'Save'
    assert_current_path new_client_visit_path(dni)
    fill_in :visit_description, with: 'una cama'
    fill_in :visit_duration, with: '2'
    click_on 'Guardar'
    assert_current_path visit_path(Visit.last)
  end
end
