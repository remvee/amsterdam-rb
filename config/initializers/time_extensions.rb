class Time
  def self.now_with_warping
    @warptime || now_without_warping
  end

  class << self
    alias_method :now_without_warping, :now
    alias_method :now, :now_with_warping
  end

  def warp
    self.class.instance_variable_set('@warptime', self)
    yield
  ensure
    self.class.instance_variable_set('@warptime', nil)
  end
end
