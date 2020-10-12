def double_num?(num)
  num = num.to_s
  half_way = num.length / 2
  num.length > 1 && (num[0..half_way - 1] == num[half_way..-1])
end

def twice(number)
  if double_num?(number)
    number
  else
    number * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10