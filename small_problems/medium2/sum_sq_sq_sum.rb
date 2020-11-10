def sum_square_difference(num)
  digits = []
  each_squared = []
  1.upto(num) do |digit|
    digits << digit
    each_squared << digit ** 2
  end
  sum_squared = digits.sum ** 2
  square_sum = each_squared.sum
  sum_squared - square_sum
end


p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150