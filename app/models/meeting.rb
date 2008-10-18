class Meeting < ActiveRecord::Base
  default_value_for :start_at do
    Date.today.next_last_monday_of_the_month.to_time + 20.hours
  end
  default_value_for :blurp, DEFAULT_BLURP
  default_value_for :gmaps_url, DEFAULT_GMAPS_URL

  validate do |meeting|
    d = meeting.start_at.to_date
    if d != d.next_last_monday_of_the_month
      meeting.errors.add(:start_at, 'should be last monday of month')
    end
  end

  validate do |meeting|
    d = meeting.start_at.to_date.to_time
    m = Meeting.first(:conditions => ['start_at >= ? AND start_at < ?', d, d + 1.day])
    if m && m != meeting
      meeting.errors.add(:start_at, 'meeting already planned for that day')
    end
  end

  def self.next(today = Date.today)
    next_start_on = today.next_last_monday_of_the_month
    next_meeting = Meeting.first(:conditions => ['start_at >= ? AND start_at < ?', next_start_on.to_time, (next_start_on + 1.day).to_time])
    next_meeting || Meeting.new(:start_at => next_start_on.to_time + 20.hours)
  end
end
