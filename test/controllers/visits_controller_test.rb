require 'test_helper'

class VisitsControllerTest < ActionController::TestCase
  def client
    clients(:john)
  end

  test 'the visit new form' do
    get :new, client_dni: client.dni
    assert_not_nil assigns(:visit)
    assert_response :success
  end

  test 'should create visit selecting an existing turn' do
    assert_difference('Visit.count') do
      post :create, client_dni: client.dni,
                    visit: { description: '2 camas',
                             duration: '2',
                             turn_id: turns(:jueves) }
      assert_redirected_to visit_path(Visit.last)
    end
  end

  test 'should create visit with a new turn' do
    assert_difference(['Visit.count', 'Turn.count']) do
      post :create, client_dni: client.dni,
        visit: { description: '2 camas',
                 duration: '2',
                 turn_id: '' },
        turn: { at: Date.tomorrow,
                employee_id: employees(:pablo) }
      assert_redirected_to visit_path(Visit.last)
    end
  end
end
