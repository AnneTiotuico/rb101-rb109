# def staggered_case(str)
#   staggered = ''
#   str.each_char.with_index do |char, idx|
#     if idx.even?
#       staggered << char.upcase
#     elsif idx.odd?
#       staggered << char.downcase
#     end
#   end
#   staggered
# end

# further exploration
def staggered_case(string, first_letter='upcase')
  result = ''
  first_letter == 'upcase' ? need_upper = true : need_upper = false
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end


p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'