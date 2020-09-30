# def staggered_case(string, first_letter='upcase')
#   result = ''
#   first_letter == 'upcase' ? need_upper = true : need_upper = false
#     string.chars.each do |char|
#       case char
#       when /[^A-Za-z]/
#         result += char
#       else
#         need_upper ? result += char.upcase : result += char.downcase
#         need_upper = !need_upper
#       end
#   end
#   result
# end


# further exploration

def staggered_case(string, only_alpha='yes')
  result = ''
  need_upper = true
  string.chars.each do |char|
    case only_alpha
    when 'yes'
      if char =~ /[a-z]/i
        need_upper ? result += char.upcase : result += char.downcase
        need_upper = !need_upper
      else
        result += char
      end
    else
      need_upper ? result += char.upcase : result += char.downcase
      need_upper = !need_upper
    end
  end
  result
end


p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('I Love Launch School!', 'no') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', 'no') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', 'no') == 'IgNoRe 77 ThE 444 NuMbErS'