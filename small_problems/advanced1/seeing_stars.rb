def star(n)
  left_spaces = 0
  spaces_between = (n - 3) / 2
  lines = 0
    until spaces_between < 0
      puts "#{' ' * left_spaces}*#{' ' * spaces_between}*#{' ' * spaces_between}*"
      lines += 1
      spaces_between -= 1
      left_spaces += 1
    end
    puts "#{'*' * n}"
    until lines == 0 do
      spaces_between += 1
      left_spaces -= 1
      puts "#{' ' * left_spaces}*#{' ' * spaces_between}*#{' ' * spaces_between}*"
      lines -= 1
    end
end


# def print_row(grid_size, distance_from_center)
#   number_of_spaces = distance_from_center - 1
#   spaces = ' ' * number_of_spaces
#   output = Array.new(3, '*').join(spaces)
#   puts output.center(grid_size)
# end

# def star(grid_size)
#   max_distance = (grid_size - 1) / 2
#   max_distance.downto(1) { |distance| print_row(grid_size, distance) }
#   puts '*' * grid_size
#   1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
# end

star(7)
# star(9)