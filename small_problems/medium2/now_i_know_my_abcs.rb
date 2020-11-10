BLOCKS = %w(BO GT VI XK RE LY DQ FS ZM CP JW NA HU)

def block_word?(word)
  word = word.upcase
  BLOCKS.all? do |block|
   (word.chars.count { |letter| block.include?(letter) }) < 2
  end
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true