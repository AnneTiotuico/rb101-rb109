puts "Please write word or multiple words:"
words = gets.chomp

characters = words.split("")

count = 0
characters.select { |char| count +=1 if !/\p{Space}/.match(char)}

puts "There are #{count} characters in \"#{words}\"."

