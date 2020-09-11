puts "What is the bill? "
bill = gets.chomp.to_f

puts "What is the tip percentage?  "
tip_rate = gets.chomp.to_f

tip_to_decimal = tip_rate / 100
tip = (bill * tip_to_decimal)
total = (bill + tip)
puts "The tip is $#{format("%.2f", tip)}"
puts "The total is $#{format("%.2f",total)}"

