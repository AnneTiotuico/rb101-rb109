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

def update_board(board, marker, position)
  board[position] = marker
  display_board(board)
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

def players_turn(board, marker)
  puts "Which box would you like to mark? (1-9)"
  position = 0
  loop do
    position = gets.chomp.to_i
    break if board[position] == ' '
    puts "Invalid box, please choose an empty box from 1-9."
  end
  update_board(board, marker, position)
end

def computers_turn(board, marker)
  position = 0
  loop do
    position = (1..9).to_a.sample
    break if board[position] == ' '
  end
  update_board(board, marker, position)
  puts "Computer played. Your turn."
end

def board_full?(board)
  board.values.all? {|marked| ['X', 'O'].include?(marked) }
end

#main game
puts "Welcome! Let's play some tic tac toe!"
board = initialize_board # blank board
display_board(board) # output board

#main loop
loop do
  #choose markers
  player_marker = choose_marker()
  comp_marker = assign_comp_marker(player_marker)
  loop do
    players_turn(board, player_marker)
    break if board_full?(board)
    computers_turn(board, comp_marker)
  end
  # if winner?
  #   "X wins!"
  # else
  #   "It's a tie"
  # end
  # break unless playagain?
  break
end

puts "Goodbye, thanks for playing!"