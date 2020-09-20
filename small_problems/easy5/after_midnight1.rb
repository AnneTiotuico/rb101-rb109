MINUTES = 60
HOURS = 24
MINUTES_A_DAY = MINUTES * HOURS

def time_of_day(mins)
  mins = mins % MINUTES_A_DAY
  hours, minutes = mins.divmod(MINUTES)
  format('%02d:%02d', hours, minutes)
end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
p time_of_day(3)