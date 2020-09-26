# Given the array below
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values are the positions in the array.

flintstones.each_with_object({}) do |value, hash|
  hash[value] = flintstones.index(value)

end

