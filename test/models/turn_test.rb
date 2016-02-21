require 'test_helper'

class TurnTest < ActiveSupport::TestCase
  test 'cannot create a new turn for a past date' do
    new_turn = Turn.new employee: employees(:pablo), at: 1.day.ago
    refute new_turn.save
    new_turn.at = Date.today
    assert new_turn.save
  end
end
