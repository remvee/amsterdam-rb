ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

class ActiveSupport::TestCase
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false

  fixtures :all

  def assert_valid(object)
    assert object.valid?, "#{object.inspect} expected to be valid"
  end
end
