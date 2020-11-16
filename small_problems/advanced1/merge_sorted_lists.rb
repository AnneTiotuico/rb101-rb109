def merge(arr1, arr2)
  return arr2 if arr1.empty?
  return arr1 if arr2.empty?
  merged = []
  idx1 = 0
  idx2 = 0
  loop do
    if idx1 > arr1.length - 1
      merged << arr2[-1]
    elsif idx2 > arr2.length - 1
      merged << arr1[-1]
    elsif arr1[idx1] < arr2[idx2]
      merged << arr1[idx1]
      idx1 += 1 unless idx1 > arr1.length - 1
    elsif arr1[idx1] > arr2[idx2]
      merged << arr2[idx2]
      idx2 += 1 unless idx2 > arr2.length - 1
    end
    break if merged.length == arr1.length + arr2.length
  end
  merged
end




p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]