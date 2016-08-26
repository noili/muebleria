module ApplicationHelper

  # Days and turns can be selected in the calendar when creating a new visit
  #
  # @todo This logic should be moved to the day object
  def selectable_day? day
    @visit && !day.expired?
  end

end
