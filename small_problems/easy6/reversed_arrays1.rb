def reverse!(arr)
  length = arr.length
  arr << arr.max(arr.size) { |a, b| arr.index(a) <=> arr.index(b) }
  arr.flatten!
  while arr.length > length
    arr.delete_at(0)
  end
  arr
end

# or

def reverse!(arr)
  arr.sort! { |a, b| arr.index(b) <=> arr.index(a) }
end

list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) #== ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) #== ["abc"]
p list == ["abc"]

list = []
p reverse!(list) #== []
p list == []