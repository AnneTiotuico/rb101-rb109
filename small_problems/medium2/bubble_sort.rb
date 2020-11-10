def bubble_sort!(array)
  loop do
    swapped = false
    array.each.with_index do |num, index|
        if index == array.length - 1
          next
        elsif array[index] > array[index + 1]
          array[index], array[index + 1]  = array[index + 1], array[index]
          swapped = true
        end
    end
    break unless swapped
  end
end

# def bubble_sort!(array)
#   loop do
#     index = 0
#     next_index = 1
#     swap_happened = false

#     until next_index >= array.size
#       if array[index] > array[next_index]
#         array[index], array[next_index] = array[next_index], array[index]
#         swap_happened = true
#       end
#       index += 1
#       next_index += 1
#     end

#     break unless swap_happened
#   end
# end




array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)