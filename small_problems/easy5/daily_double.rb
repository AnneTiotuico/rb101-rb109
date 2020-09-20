def crunch(str)
  unique_chars = str.split.map do |word|
    word.chars.chunk(&:itself).map(&:first).join
  end
  unique_chars.join(' ')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''