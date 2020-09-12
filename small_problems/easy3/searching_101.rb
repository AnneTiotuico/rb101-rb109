numbers = []
puts "==> Enter the 1st number:"
first_num = gets.chomp.to_i
numbers << first_num
puts "==> Enter the 2nd number:"
second_num = gets.chomp.to_i
numbers << second_num
puts "==> Enter the 3rd number:"
third_num = gets.chomp.to_i
numbers << third_num
puts "==> Enter the 4th number:"
fourth_num = gets.chomp.to_i
numbers << fourth_num
puts "==> Enter the 5th number:"
fifth_num = gets.chomp.to_i
numbers << fifth_num
puts "==> Enter the last number:"
last_num = gets.chomp.to_i

if numbers.include?(last_num)
  puts "The number #{last_num} appears in #{numbers}."
else
  puts "The number #{last_num} does not appear in #{numbers}."
end

