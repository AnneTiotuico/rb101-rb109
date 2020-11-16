def egyptian(rational)
  denominators = []
  sum = 0
  denominator = 1
  loop do
    difference = rational - sum
    e_frac = Rational(1, denominator)
    if e_frac <= difference
      sum += e_frac
      denominators << denominator
    end
    denominator += 1
    break if sum == rational
  end
  denominators
end

def unegyptian(denominators)
  denominators.inject(0) do |sum, denominator|
    sum + Rational(1, denominator)
  end
end

p egyptian(Rational(2, 1))    == [1, 2, 3, 6]
p egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]
p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)