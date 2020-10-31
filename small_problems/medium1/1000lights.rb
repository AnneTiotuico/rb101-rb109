# def lights(n)
#   state = "OFF "
#   switch_bank = (1..n).to_a.zip((state*n).split).to_h
#   (1..n).each do |round|
#     p (switch_bank.each_pair.map do |key, value|
#       if key % round == 0
#         value == "ON" ? value = 'OFF' : value = 'ON'
#       else
#         value
#       end
#     end)
#   end
# end
require 'pry'

def lights(n)
  state = "OFF "
  switch_bank = (1..n).to_a.zip((state*n).split).to_h
  round = 1
  loop do
    toggle = switch_bank.select {|key, value| key % round == 0 }
    switch_bank.each_pair.map do |key, value|
      if toggle.keys.include?(key)
        switch_bank[key] == 'ON' ? switch_bank[key]  = 'OFF' : switch_bank[key] = 'ON'
      end
    end
    round +=1
    break if round > n
  end
  switch_bank.select { |key, value| value == 'ON' }.keys
end


p lights(5) == [1, 4]
p lights(10) == [1, 4, 9]
p lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
# initial {1=>"OFF", 2=>"OFF", 3=>"OFF", 4=>"OFF", 5=>"OFF"}
# 1st     {1=>"ON", 2=>"ON", 3=>"ON", 4=>"ON", 5=>"ON"}
# 2nd     {1=>"ON", 2=>"OFF", 3=>"ON", 4=>"OFF", 5=>"ON"}
# 3rd     {1=>"ON", 2=>"OFF", 3=>"OFF", 4=>"OFF", 5=>"ON"}
# 4th     {1=>"ON", 2=>"OFF", 3=>"OFF", 4=>"ON", 5=>"ON"}
# 5th     {1=>"ON", 2=>"OFF", 3=>"OFF", 4=>"ON", 5=>"OFF"}
