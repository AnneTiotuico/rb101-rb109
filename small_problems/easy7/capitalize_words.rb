# def word_cap(str)
#   words = str.downcase.split
#   capitalized_words = []
#   words.each do |word|
#     if word.start_with?(/[a-z]/)
#       capitalized_words << word[0].upcase! + word[1..-1]
#     else
#       capitalized_words << word
#     end
#   end
#   capitalized_words.join(' ')
# end

# def word_cap(str)
#   words = str.downcase.split
#   words.map { |word| word.tr!(word.chr, word.chr.upcase) }.join(' ')
# end


# def word_cap(str)
#   str.split.map{ |word| word.capitalize }.join(' ')
# end

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'