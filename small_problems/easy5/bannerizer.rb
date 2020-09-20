MAX_WIDTH = 78

def print_in_box(str)
  if str.chars.length > MAX_WIDTH
    str = str[0..78]
  end
  border_width = "-" * (str.length + 2)
  padding_width = " " * (str.length + 2)
  puts "+#{border_width}+"
  puts "|#{padding_width}|"
  puts "| #{str} |"
  puts "|#{padding_width}|"
  puts "+#{border_width}+"
end


print_in_box('To boldly go where no one has gone before.')
print_in_box('')

print_in_box('To boldly go where no one has gone before. To boldly go where no one has gone before.')