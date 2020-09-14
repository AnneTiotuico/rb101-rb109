def factors(number)
  divisor = number
  factors = []
  loop do
    break if number <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(0)