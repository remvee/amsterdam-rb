module WelcomeHelper
  def next_last_monday_of_the_month(start = Date.today)
    t, m, l = start, start.month, nil

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
