puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retired_age = gets.chomp.to_i

current_year = Time.now.year
years_left = retired_age - age
retired_year = current_year + years_left

puts "It's #{current_year}. You will retire in #{retired_year}."
puts "You only have #{years_left} years of work to go!"

