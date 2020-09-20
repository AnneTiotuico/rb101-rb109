def swap(str)
  words = str.split(' ')
  swapped = words.each { |w| w[0], w[-1] = w[-1], w[0] }
  swapped.join(' ')
end


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'