def century(year)
  if year % 100 == 0
    century = year / 100
  else
    century = (year / 100) + 1
  end
  century.to_s + suffix(century)
end

def suffix(century)
  if [11, 12, 13].include?(century % 100)
    "th"
  elsif century % 10 == 1
    "st"
  elsif century % 10 == 2
    "nd"
  elsif century % 10 == 3
    "rd"
  else
    "th"
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

