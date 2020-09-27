# def triangles(int)
#   star =  '*'
#   (1..int).each do |num|
#     puts (star * num).rjust(int)
#   end
# end

def triangles(int)
  star =  '*'
  int.downto(1).each do |num|
    puts (star * num).rjust(int)
  end
end


triangles(9)