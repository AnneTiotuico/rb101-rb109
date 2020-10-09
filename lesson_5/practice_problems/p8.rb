hsh = {first: ['the', 'quick'], second: ['brown', 'fox'],
      third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# hsh.each do |key, value|
#   value.each do |str|
#     str.each_char do |char|
#       puts char if ['a','e','i','o','u'].include?(char)
#     end
#   end
# end

# or
hsh.each do |key, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if 'aeiou'.include?(char)
    end
  end
end

