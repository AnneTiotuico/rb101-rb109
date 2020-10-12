# def uppercase?(str)
#   alpha = str.gsub('^a-zA-Z', '')
#   alpha.chars.all? {|char| char == char.upcase}
# end

def uppercase?(string)
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
