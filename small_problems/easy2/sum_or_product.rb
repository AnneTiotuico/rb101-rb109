def compute_sum(number)
  (1..number).inject(:+)
end

def compute_product(number)
  (1..number).inject(:*)
end

def valid_number?(number)
  true if number.integer? && number > 0
end

def valid_choice?(operation)
  true if ['s', 'p'].include?(operation.downcase)
end

number = ''
loop do
  puts ">> Please enter an integer greater than 0"
  number = gets.chomp.to_i
  break if valid_number?(number)
  puts "Please enter a valid number"
end

operation = ''
loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp
  break if valid_choice?(operation)
  puts "Please enter 's' or 'p'."
end

if operation == 's'
  sum = compute_sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif operation == 'p'
  product = compute_product(number)
  puts "The product of the integers between 1 and #{number} is #{product}."
else
  puts "Oops. Unknown operation."
end

