HEX = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c', 'd', 'e', 'f']

def generate_uuid
  first = ''
  second = ''
  third = ''
  fourth = ''
  fifth = ''
  while first.size < 8 do
    first << HEX.sample.to_s
  end
  while second.size < 4 do
    second << HEX.sample.to_s
  end
  while third.size < 4 do
    third << HEX.sample.to_s
  end
  while fourth.size < 4 do
    fourth << HEX.sample.to_s
  end
  while fifth.size < 12 do
    fifth << HEX.sample.to_s
  end
  p "#{first}-#{second}-#{third}-#{fourth}-#{fifth}"
end


generate_uuid()


# or
# def generate_UUID
#   characters = []
#   (0..9).each { |digit| characters << digit.to_s }
#   ('a'..'f').each { |digit| characters << digit }

#   uuid = ""
#   sections = [8, 4, 4, 4, 12]
#   sections.each_with_index do |section, index|
#     section.times { uuid += characters.sample }
#     uuid += '-' unless index >= sections.size - 1
#   end

#   uuid
# end