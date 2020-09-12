def oddities(arr)
  odd_arr = Array.new
  arr.map.with_index { |x, i| odd_arr << x if i.even? }
  odd_arr
end

def evenities(arr)
  even_arr = Array.new
  i = 1
  while i < arr.length
    even_arr << arr[i]
    i += 2
  end
  even_arr
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []


p evenities([2, 3, 4, 5, 6]) == [3, 5]
p evenities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evenities(['abc', 'def']) == ['def']
p evenities([123]) == []
p evenities([]) == []