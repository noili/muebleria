require 'test_helper'

class AdminFlowTest < ActionDispatch::IntegrationTest

  test 'adding a new visit for a new client' do
    visit '/'
    page
    assert_current_path new_session_path
    fill_in :email, with: users(:admin).email
    fill_in :password, with: 'secret'
    click_on 'Sign in'
    assert_current_path new_client_path
  end

end
