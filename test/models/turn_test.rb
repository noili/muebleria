require 'test_helper'

class TurnTest < ActiveSupport::TestCase
  test 'cannot create a new turn for a past date' do
    new_turn = Turn.new employee: employees(:pablo), at: 1.day.ago
    refute new_turn.save
    new_turn.at = Date.today
    assert new_turn.save
  end

  test 'string representation is full of info' do
    date = Date.parse('Monday')
    turn = Turn.new employee: employees(:pablo),
      at: date
    assert_match /\(Pablo\)/, turn.to_s, 'display employee'
    assert_match /#{date.day}/, turn.to_s, 'display date'
  end
end
