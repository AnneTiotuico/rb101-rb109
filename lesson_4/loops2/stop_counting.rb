# The method below counts from 0 to 4.
# Modify the block so that it prints the current number and stops iterating when the current number equals 2.

# 5.times do |index|
#   # ...
# end

5.times do |index|
  puts index
  break if index == 2
end

# Further Exploration
# Without running this code, how many values will be printed?


# 5.times do |index|
#   puts index
#   break if index == 4
# end

# => this will print 5 values

# Now, consider this code:

# 5.times do |index|
#   puts index
#   break if index < 7
# end
# How many values will be printed this time?

# => this will print 1 value because it will iterate once, but since the break statement right after evaluates to true, it will stop