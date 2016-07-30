require 'test_helper'

class VisitTest < ActiveSupport::TestCase

  test 'visit has zone' do
    visit = clients(:john).visits.create! turn: turns(:tomorrow)
    assert_equal 'norte', visit.zone
  end

  test 'visit details do not change once created' do
    visit = clients(:pablo).visits.create! turn: turns(:tomorrow)
    clients(:pablo).update! address: 'Norte 123',
                            zone: zones(:norte)
    visit.reload
    assert_equal 'Sur 321', visit.address
    assert_equal 'sur',     visit.zone
  end

end
