STR_NUMS = {0=> '0', 1=> '1', 2=> '2', 3=> '3', 4=> '4',
        5=> '5', 6=> '6', 7=> '7', 8=> '8', 9=> '9',
        }

=begin
def integer_to_string(int)
  ints = int.digits.reverse!
  result = ''
  ints.map { |i| result << STR_NUMS[i]  }
  result
end
=end

# or

def integer_to_string(int)
  int.digits.reverse!.join
end


p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'