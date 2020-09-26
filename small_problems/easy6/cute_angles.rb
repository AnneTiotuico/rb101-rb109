DEGREE = "\xC2\xB0"

def dms(deg_float)
  degrees, remainder = deg_float.divmod(1)
  minutes, seconds = (remainder * 60).divmod(1)
  seconds *= 60
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

#Further Exploration
def dms(deg_float)
  deg_float = deg_float % 360
  degrees, remainder = deg_float.divmod(1)
  minutes, seconds = (remainder * 60).divmod(1)
  seconds *= 60
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) #== %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")


#Further Exploration
p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")
