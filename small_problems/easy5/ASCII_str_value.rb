def ascii_value(string)
  result = 0
  string.chars { |c| result += c.ord  }
  result
end


p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0