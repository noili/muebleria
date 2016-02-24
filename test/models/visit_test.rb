require 'test_helper'

class VisitTest < ActiveSupport::TestCase

  test 'visit has client zone' do
    john = clients :john
    john.update zone: zones(:norte)
    visit = Visit.create client: john
    assert_equal zones(:norte), visit.zone
  end

end
