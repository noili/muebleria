require 'test_helper'

class DayTest < ActiveSupport::TestCase
  def calendar
    Day.build
  end

  test 'each day is an active model object' do
    assert_kind_of ActiveModel::Conversion, calendar.first
  end
end
