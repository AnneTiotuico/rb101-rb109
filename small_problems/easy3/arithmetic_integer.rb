puts "Enter the first number:"
first_number = gets.chomp.to_f

second_number = 0
loop do
  puts "Enter the second number:"
  second_number = gets.chomp.to_f
  break unless second_number == 0
  puts "Cannot divide by zero."
end

addition = first_number +  second_number
puts "#{first_number} + #{second_number} = #{addition}"

subtraction = first_number - second_number
puts "#{first_number} - #{second_number} = #{subtraction}"

product = first_number * second_number
puts "#{first_number} * #{second_number} = #{product}"

quotient = first_number / second_number
puts "#{first_number} / #{second_number} = #{quotient}"

remainder = first_number % second_number
puts "#{first_number} % #{second_number} = #{remainder}"

power = first_number ** second_number
puts "#{first_number} ** #{second_number} = #{power}"
