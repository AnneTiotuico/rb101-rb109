def letter_case_count(str)
  case_counts = {lowercase: 0, uppercase: 0, neither: 0}
  str.each_char do |char|
    if ('a'..'z').include?(char)
      case_counts[:lowercase] += 1
    elsif ('A'..'Z').include?(char)
      case_counts[:uppercase] += 1
    else
      case_counts[:neither] += 1
    end
  end
  case_counts
end


p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }