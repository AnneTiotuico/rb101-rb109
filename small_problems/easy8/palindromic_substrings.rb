def substrings(str)
  substrings_arr = []
  0.upto(str.length - 1) do |idx|
    1.upto(str.length - idx) do |length|
      substrings_arr << str[idx, length]
    end
  end
  substrings_arr
end

def palindromes(str)
  substrings(str).each_with_object([]) do |sub_str, arr|
    arr << sub_str if palindrome?(sub_str)
  end
end

def palindrome?(str)
  str = str.downcase.gsub(/\W/, '')
  str == str.reverse && str.length > 1
end

# def palindrome?(str)
#   str = str.downcase
#   str == str.reverse && str.length > 1 && str.chars.none?(/[^[:alpha:]]/)
# end



p palindromes('abcd') == []
p palindromes('Mad-am') #== ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') #== [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]