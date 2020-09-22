# Given the array below, use loop to remove and print each name.
# Stop the loop once names doesn't contain any more elements.

# names = ['Sally', 'Joe', 'Lisa', 'Henry']

# Keep in mind to only use loop, not while, until, etc.

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.empty?
end

# Further Exploration
# Our solution prints the names from first (Sally) to last (Henry). Can you change this to print the names from last to first?

# loop do
#   puts names.pop
#   break if names.empty?
# end