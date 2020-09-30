# def multiply_list(arr1, arr2)
#   arr = [arr1] + [arr2]
#   arr.transpose.map { |x| x.first * x.last }
# end

# or

# def multiply_list(list_1, list_2)
#   products = []
#   list_1.each_with_index do |item, index|
#     products << item * list_2[index]
#   end
#   products
# end

# further exploration
def multiply_list(arr1, arr2)
  arr1.zip(arr2).map{ |pair| pair.reduce(&:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]