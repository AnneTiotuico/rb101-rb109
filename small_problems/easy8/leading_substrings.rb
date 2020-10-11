def leading_substrings(str)
  sub_strings = []
  1.upto(str.length) { |length| sub_strings << str[0, length] }
  sub_strings
end


p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']