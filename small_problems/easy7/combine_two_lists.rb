# def interleave(arr1, arr2)
#   interleave_arr = []
#   while arr1.length > 0
#     interleave_arr << arr1.shift
#     interleave_arr << arr2.shift
#   end
#   interleave_arr
# end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end


p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']