require 'test_helper'

class MeetingTest < ActiveSupport::TestCase
  def test_next_creates_new_meeting_if_not_available
    m = Meeting.next
    assert_kind_of Meeting, m
    assert_equal Date.today.next_last_monday_of_the_month, m.start_at.to_date
  end

  def test_next_finds_existing_meeting_if_available
    m = Meeting.next(Date.new(2008, 5, 1))
    assert_equal meetings(:one), m
  end

  def test_start_at_should_be_last_monday_of_month
    assert_no_difference 'Meeting.count' do
      m = Meeting.new(:start_at => Date.new(2008, 10, 20))
      m.save
      assert_not_nil m.errors.on(:start_at)
    end
  end

  def test_start_at_defaults_to_next_last_monday_of_month_at_20h
    assert_equal Date.today.next_last_monday_of_the_month.to_time + 20.hours, Meeting.new.start_at
  end
end
