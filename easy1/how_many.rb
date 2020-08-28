# Write a method that counts the number of occurrences of each element in a given array.

=begin
input: array of elements

output: hash where the element is the key and the occurence is the value
=end

def count_occurrences(array)
  occurrences = {}
    array.each do |element| 
        occurrences[element] = array.count(element)
    end
  occurrences.each_pair {|key, value| puts "#{key} => #{value}" }
end

=begin
further exploration
Try to solve the problem when words are case insensitive, e.g. "suv" == "SUV".

def count_occurrences(array)
  occurrences = {}
    array.each do |element| 
      element.downcase!
        occurrences[element] = array.count(element)
    end
  occurrences.each_pair {|key, value| puts "#{key} => #{value}" }
end

=end


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

count_occurrences(vehicles)