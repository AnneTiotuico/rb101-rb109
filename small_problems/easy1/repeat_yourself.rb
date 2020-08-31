# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.
# example:
# repeat('Hello', 3)
# output:
# Hello
# Hello
# Hello

=begin
input :
-a string and a positive integer >= 0


output :
-input string is printed out as many times as the postive integer indicates
=end

def repeat(string, integer)
    puts (string + "\n") * integer if integer > 0 
end

# OR
=begin
def repeat(string, number)
  number.times do
    puts string
  end
end
=end

repeat('Hello', 3)
repeat('Hello', 0)
repeat('Hello', 5)