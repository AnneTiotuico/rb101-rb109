def multiply(num1, num2)
  num1 * num2
end

def square(num, power)
  product = 1
  if power > 0
    power.times { product = multiply(num, product) }
  else
    (-power).times { product = multiply(product, 1 / num.to_f) }
  end
  product
end

p square(5, 2) == 25
p square(-8, 2) == 64

