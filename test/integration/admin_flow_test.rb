require 'test_helper'

class AdminFlowTest < ActionDispatch::IntegrationTest

  SAMPLE_CLIENT = {
    client_name: 'John Doe',
    client_address: '25 de Mayo 2445 piso 2 dpto 3',
    client_cellphone: '155-325565'
  }

  def login user: users(:admin)
    visit '/'
    page
    assert_current_path new_session_path
    fill_in :email, with: users(:admin).email
    fill_in :password, with: 'secret'
    click_on 'Iniciar'
    assert_current_path new_client_path
  end

  def create_client dni: '302020202'
    visit new_client_path
    fill_in 'Buscar DNI', with: dni
    click_on 'Search'
    assert_current_path edit_client_path(dni)
    SAMPLE_CLIENT.each do |attr, value|
      fill_in attr, with: value
    end
    select 'sur', from: 'client_zone_id'
    click_on 'Guardar'
    assert_current_path new_client_visit_path(dni)
  end

  test 'adding a new visit on an existing turn' do
    login
    create_client
    fill_in :visit_description, with: 'una cama'
    fill_in :visit_duration, with: '2'
    select turns(:tomorrow).to_s, from: 'Turno'
    click_on 'Guardar'
    assert page.has_content? 'Visita creada'
  end

  test 'adding a new visit on a new turn' do
    login
    create_client
    fill_in :visit_description, with: 'una cama'
    fill_in :visit_duration, with: '2'
    within("fieldset#new-turn") do
      fill_in 'Fecha', :with => (Date.today + 3)
      select 'Pablo', :from => 'Employee'
    end
    click_on 'Guardar'
    assert page.has_content? 'Visita creada'
  end
end
