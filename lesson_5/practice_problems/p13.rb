arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

result = arr.sort_by do |sub_arr|
  p (sub_arr.select do |el|
    el.odd?
  end)
end

p result == [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

