=begin
NUMS = {'0'=> 0,
          '1'=> 1,
          '2'=> 2,
          '3'=> 3,
          '4'=> 4,
          '5'=> 5,
          '6'=> 6,
          '7'=> 7,
          '8'=> 8,
          '9'=> 9,  }

def string_to_integer(str)
  ints = str.chars.map { |c| (NUMS[c]) }
  ints.inject{ |result, i| result*10 + i}
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

=end

# further exploration
HEX = {'0'=> 0, '1'=> 1, '2'=> 2, '3'=> 3, '4'=> 4, '5'=> 5, '6'=> 6, '7'=> 7, '8'=> 8,
       '9'=> 9, 'A'=> 10, 'B'=> 11, 'C'=> 12, 'D'=> 13, 'E'=> 14, 'F'=> 15
      }

def hexadecimal_to_integer(hex)
  hex.upcase!
  ints = hex.chars.map { |c| (HEX[c]) }
  ints.reverse!
  result = 0
  ints.map.with_index{ |int, i| ( result += int * (16 ** i))}
  p result
end

p hexadecimal_to_integer('4D9f') == 19871
p hexadecimal_to_integer('7DE') == 2014