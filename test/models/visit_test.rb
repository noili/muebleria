require 'test_helper'

class VisitTest < ActiveSupport::TestCase

  test 'visit_has_client_zone' do
    john = clients :john
    john.update zone: zones(:norte)
    visit = Visit.create client: john
    assert visit.zone == zones(:norte)
  end

end
