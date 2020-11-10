def convert_to_percentage(string, result)
  total = string.length.to_f
  result.each_pair do |key, value|
    result[key] = (((value.to_f / total) * 100))
  end
  result
end

def letter_percentages(string)
  result = {lowercase: 0, uppercase: 0, neither: 0}
  string.chars do |char|
    if /[[:lower:]]/.match?(char)
      result[:lowercase] += 1
    elsif /[[:upper:]]/.match?(char)
      result[:uppercase] += 1
    else
      result[:neither] += 1
    end
    result
  end
  convert_to_percentage(string, result)
end


p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }