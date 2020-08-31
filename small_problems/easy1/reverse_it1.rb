# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

# input: string
# output: input string in reverse order, not each individual word gets reversed, but the sentence reverses the word order

def reverse_sentence(string)
  string.split.reverse.join(' ')
end



puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'