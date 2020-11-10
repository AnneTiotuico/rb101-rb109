def balanced?(string)
  open_paren = 0
  close_paren = 0
  last_paren = ')'
  string.chars do |char|
    if char == '('
      last_paren = char
      open_paren += 1
    elsif char == ')'
      last_paren = char
      close_paren += 1
    end
  end
  (open_paren == close_paren) && (last_paren == ')')
end


p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false