def sum_even_number_row(row_number)
  rows = []
  start_integer = 2
  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end
  rows.last.sum
end

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  loop do
    row << current_integer
    current_integer += 2
    break if row.length == row_length
  end
  row
end



# Row number: 1 → sum of integers in row: 2
# Row number: 2 → sum of integers in row: 10
# Row number: 3: → sum of integers in row: 68

p sum_even_number_row(1) == 2
p sum_even_number_row(2) == 10
p sum_even_number_row(4) == 68

# Create an empty ‘rows’ array to contain all of the rows
# Create a ‘row’ array and add it to the overall ‘rows’ array*
# Repeat step 2 until all the necessary rows have been created
# 	- All rows have been created when the length of the ‘rows’ array is equal to the input integer
# Sum the final row
# Return the sum


# Start: 2, length: 1 → [2]
# Start: 4, length: 2 → [4, 6]
# Start: 8, length: 3 → [8, 10, 12]

# calculating the starting integer:
# RULE: first integer of row == last integer of the preceding row + 2
# algorithm:
#   - get the preceding row of the rows array
#   - get last integer of that row
#   - add 2 to the integer

# p create_row(2, 1) == [2]
# p create_row(4, 2) == [4, 6]
# p create_row(8, 3) == [8, 10, 12]

# Create an empty ‘row’ array to contain the integers
# Add the starting integer
# Increment the starting integer by 2 to get the next integer in the sequence
# Repeat steps 2 & 3 until the array has reached the correct length
# Return the ‘row’ array

# start the loop
#   - add the start integer to the row
#   - increment the start integer by 2
#   - break out of the loop if length of row equals row_length

