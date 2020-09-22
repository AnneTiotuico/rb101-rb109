# Using a while loop, print 5 random numbers between 0 and 99.
# The code below shows an example of how to begin solving this exercise.

# numbers = []

# while <condition>
#   # ...
# end

# Example output (your numbers will most likely be different):

# 62
# 96
# 31
# 16
# 36

numbers = []

while numbers.length < 5
  numbers << rand(99)
end

puts numbers