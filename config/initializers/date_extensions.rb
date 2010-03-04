require 'active_support'

module DateExtensions
  def next_last_monday_of_the_month
    t, m, l = self, month, nil

    loop do
      l = t if t.wday == 1 # monday
      t += 1.day

      if m != t.month
        break if l
        m = t.month
      end
    end

    l.to_date
  end
end

Date.send(:include, DateExtensions)
