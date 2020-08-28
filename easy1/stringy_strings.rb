# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

def stringy(num)
  string = ""
  while string.length < num
    string << '1'
    break if string.length == num
    string << '0'
  end
  p string  
end


# further exploration
# Modify stringy so it takes an additional optional argument that defaults to 1. 
# If the method is called with this argument set to 0, the method should return a String of alternating 0s and 1s, but starting with 0 instead of 1.

def stringy(size, start=1)
  numbers = []

  size.times do |index|
    if start == 1
      number = index.even? ? 1 : 0
    else
      number = index.even? ? 0 : 1
    end
    numbers << number
  end

  numbers.join
end



puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'