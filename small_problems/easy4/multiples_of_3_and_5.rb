def multisum(num)
  result = 0
  multiples = []
  (1..num).each do |x|
    multiples << x if x % 3 == 0 || x % 5 == 0
  end
  multiples.each { |multiple| result += multiple }
  result
end

#or

def multisum(num)
  (1..num).select { |n| n if n % 3 == 0 || n % 5 == 0 }.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168