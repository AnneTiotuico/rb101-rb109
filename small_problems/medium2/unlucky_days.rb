require 'date'

def friday_13th(year)
  start_date = Date.new(year, 1, 1)
  end_date = Date.new(year, 12, 31)
  start_date.upto(end_date).count do |date|
    date.friday? && date.mday == 13
  end
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2