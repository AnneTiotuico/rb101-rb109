MINUTES = 60
HOURS = 24
MINUTES_A_DAY = MINUTES * HOURS

def after_midnight(time)
  time.delete!(':')
  if time == '2400'
    0
  else
    time = time.to_i
    hours, minutes = time.divmod(100)
    hours * 60 + minutes
  end
end

def before_midnight(time)
  time = after_midnight(time)
  if time == 0
    0
  else
    1440 - time
  end
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
