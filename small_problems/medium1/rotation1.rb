def rotate_array(arr)
  new_arr = arr.dup
  first = new_arr.shift
  new_arr << first
end

# #or

# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end

#or

# def rotate_array(array)
#   array.last(array.length - 1) << array.first
# end

# p rotate_array([7, 3, 5, 2, 9, 1]) #== [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# further exploration
def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(int)
  rotate_array(int.digits.reverse).join.to_i
end

p rotate_string('string') == 'trings'

p rotate_integer(12345) == 23451