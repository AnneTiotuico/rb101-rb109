def triangle(num1, num2, num3)
  lengths = [num1, num2, num3].sort
  return :invalid if lengths.any? { |length| length < 1 } || lengths[0] + lengths[1] < lengths[-1]
  return :equilateral if lengths.all? { |length| length.eql?(num1) }
  return :isosceles if lengths[0] == lengths[1] || lengths[1] == lengths[-1]
  return :scalene if lengths[0] + lengths[1] > lengths[-1]
end



p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid