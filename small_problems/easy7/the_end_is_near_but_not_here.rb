# first try
# def penultimate(str)
#   words = str.split
#   words.select.with_index { |word, idx| idx == (words.length - 2) }[0]
# end

# second try
# def penultimate(str)
#   words = str.split
#   words[-2]
# end



# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

# further exploration
def middle_word(str)
  if str.length < 1
    str
  else
    words = str.split
    if words.length.odd?
      mid = words.length / 2
    else
      mid = (words.length / 2) - 1
    end
    words[mid]
  end
end

p middle_word('first middle end') == 'middle'
p middle_word('hello there how are you') == 'how'
p middle_word('') == ''
p middle_word('word') == 'word'
p middle_word('even number of words') == 'number'

