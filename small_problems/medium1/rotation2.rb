def rotate_array(array)
  array[1..-1] + [array[0]]
end

# def rotate_rightmost_digits(int, num)
#   int_array = int.digits.reverse
#   int_array[0..(-num-1)].append(rotate_array(int_array.last(num))).join.to_i
# end

# or
def rotate_rightmost_digits(int, num)
  int_array = int.to_s.chars
  int_array[-num..-1] = rotate_array(int_array.last(num))
  int_array.join.to_i
end

# or
# def rotate_rightmost_digits(integer, num)
#   array_of_digits = integer.digits.reverse
#   deleted_number = array_of_digits.delete_at(-num)
#   array_of_digits.append(deleted_number).join.to_i
# end

p rotate_rightmost_digits(735291, 1) #== 735291
p rotate_rightmost_digits(735291, 2) #== 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917