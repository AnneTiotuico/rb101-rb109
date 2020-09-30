def swapcase(str)
  swapped = ''
  str.each_char { |c| ('a'..'z').include?(c) ? swapped << c.upcase : swapped << c.downcase }
  swapped
end


p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
