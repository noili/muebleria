class DaysController < ApplicationController
  def index
    @calendar = Day.build
  end
end
