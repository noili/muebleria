require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'authentication' do
    assert users(:admin).authenticate('secret'), 'authenticate with valid pass'
    refute users(:admin).authenticate('other'), 'fails with invalid pass'
  end

end
