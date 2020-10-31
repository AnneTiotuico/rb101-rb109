require 'pry'

def diamond(n)
  num1 = n / 2
  num2 = 1
  stars = ''
  spaces = ''
  until num1 == 0
    stars = '*' * num2
    spaces = ' ' * num1
    num1 -= 1
    num2 += 2
    puts spaces + stars
  end
  while num2 >= 1
    stars = '*' * num2
    spaces = ' ' * num1
    num1 += 1
    num2 -= 2
    puts spaces + stars
  end
end



diamond(1)
diamond(3)
diamond(9)