statement = "The Flintstones Rock"

characters = statement.chars
counts = characters.each_with_object({}) do |char, hash|
  hash[char] = characters.count(char) if char != " "
end

p counts

# OR
# result = {}
# letters = ('A'..'Z').to_a + ('a'..'z').to_a
# letters.each do |letter|
#   letter_frequency = statement.scan(letter).count
#   result[letter] = letter_frequency if letter_frequency > 0
# end

# p result