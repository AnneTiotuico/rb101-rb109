def display_board(brd)
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = ' '} #{1=> ' ', 2=> ' '...etc}
  new_board
end

def choose_marker
  marker = ''
  loop do
    puts "Choose your marker: X or O"
    marker = gets.chomp.upcase
    break if ['X', 'O'].include?(marker)
    puts "Please enter a valid marker."
  end
  marker
end

def assign_comp_marker(player_marker)
  player_marker == 'X' ? 'O' : 'X'
end

def players_turn(marker, position)
  display_board(brd)
  brd[position] = marker
end

def computers_turn(marker)

end

#main game
puts "Welcome! Let's play some tic tac toe!"
board = initialize_board # blank board
display_board(board)

#main loop
loop do
  #choose markers
  player_marker = choose_marker()
  comp_marker = assign_comp_marker(player_marker)
  p player_marker
  p comp_marker
  # loop do
  #   players_turn(player_marker, position)
  #   display_board(board) # display updated board with player mark
  #   break if winner? || board_full?
  #   computers_turn(comp_marker)
  #   display_board(board) # display updated board with computer mark
  # end
  # if winner?
  #   "X wins!"
  # else
  #   "It's a tie"
  # end
  # break unless playagain?
end

puts "Goodbye, thanks for playing!"