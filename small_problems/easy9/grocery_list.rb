def buy_fruit(grocery_list)
  grocery_list.each_with_object([]) do |(fruit, quantity), list|
    quantity.times { list << fruit }
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
