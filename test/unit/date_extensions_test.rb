require File.dirname(__FILE__) + '/../test_helper'

class DateExtensionsTest < Test::Unit::TestCase
  def test_last_monday_of_2008_05_01_is_2008_05_26
    assert_equal Date.new(2008, 5, 26), Date.new(2008, 5, 1).next_last_monday_of_the_month
  end

  def test_last_monday_on_last_monday_should_return_that_monday
    assert_equal Date.new(2008, 5, 26), Date.new(2008, 5, 26).next_last_monday_of_the_month
  end

  def test_last_monday_of_last_thursday_should_return_next_months
    assert_equal Date.new(2008, 6, 30), Date.new(2008, 5, 27).next_last_monday_of_the_month
  end
end
