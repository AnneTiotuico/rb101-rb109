SQFEET_TO_SQIN = 144
SQFEET_TO_SQCM = 929.03

puts "Enter the length of the room in feet:"
length = gets.chomp.to_f
puts "Enter the width of the room in feet:"
width = gets.chomp.to_f

square_feet = (length * width).round(2)
square_in = (square_feet * SQFEET_TO_SQIN).round(2)
square_cm = (square_feet * SQFEET_TO_SQCM).round(2)

puts "The area of the room is #{square_feet} square feet " + \
      "(#{square_in} square inches, #{square_cm} square centimeters})."

