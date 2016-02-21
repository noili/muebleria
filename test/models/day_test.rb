require 'test_helper'

class DayTest < ActiveSupport::TestCase
  def calendar
    Day.build
  end

  test 'each day is an active model object' do
    assert_kind_of ActiveModel::Conversion, calendar.first
  end

  test 'calendars can be build with many weeks' do
    assert_equal 14, Day.build(2).size
  end
end
