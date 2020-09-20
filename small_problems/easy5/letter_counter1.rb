
def count(words, length)
  words.count {|w| w.length == length}
end

def word_sizes(str)
  size_count = Hash.new
  words = str.split(" ")
  words.sort_by! { |word| word.length}
  words.each do |word|
    if !size_count.assoc(word.length)
      size_count[word.length] = count(words, word.length)
    end
  end
  size_count
end


#or
def word_sizes(str)
  str.split.map { |word| word.size }.tally
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
