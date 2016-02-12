require 'date'

class Day
  include ActiveModel::Conversion

  attr_reader :date

  def initialize date
    @date = date
  end

  def self.build
    at_beginning_of_week = Time.now.to_date.at_beginning_of_week
    (at_beginning_of_week ... at_beginning_of_week + 7.days).map do |date|
      new date
    end
  end

end
