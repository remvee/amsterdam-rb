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
      m = Meeting.create(:start_at => Date.new(2008, 10, 20))
      assert_equal 'should be last monday of month', m.errors.on(:start_at)
    end
  end

  def test_start_at_defaults_to_next_last_monday_of_month_at_20h
    assert_equal Date.today.next_last_monday_of_the_month.to_time + DEFAULT_START_TIME, Meeting.new.start_at
  end

  def test_allow_only_one_meeting_a_day
    Meeting.create!
    m = Meeting.create
    assert_equal 'meeting already planned for that day', m.errors.on(:start_at)
  end
end
