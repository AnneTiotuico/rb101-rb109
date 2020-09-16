NUMS = {'0'=> 0, '1'=> 1, '2'=> 2, '3'=> 3, '4'=> 4,
        '5'=> 5, '6'=> 6, '7'=> 7, '8'=> 8, '9'=> 9,
        }

def string_to_integer(str)
  ints = str.chars.map { |c| (NUMS[c]) }
  ints.inject{ |result, i| result*10 + i}
end

=begin
def string_to_signed_integer(str)
  if str[0] == '-'
    -string_to_integer(str[1..-1])
  elsif str[0] == '+'
    string_to_integer(str[1..-1])
  else
    string_to_integer(str)
  end
end
=end

#further exploration
def string_to_signed_integer(str)
  no_sign = string_to_integer(str.delete('+-'))
  str[0] == '-' ? -no_sign : no_sign
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100