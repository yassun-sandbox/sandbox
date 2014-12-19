class CalendarController < ApplicationController
  def index
    from_date = Date.new(2014, 11, 1).beginning_of_week(:sunday)
    to_date = Date.new(2014, 11, 30).end_of_week(:sunday)
    @calendar_data = from_date.upto(to_date)
  end
end
