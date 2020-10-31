def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def max_rotation(num)
  iterations = num.digits.length-1
  current_num = num
  (iterations.to_i).downto(0).map {|n|
    current_num = rotate_rightmost_digits(current_num, n+1)
    n -= 1
  }
  current_num
end


p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

=begin
735291 input
352917
329175
321759
321597
321579
=end