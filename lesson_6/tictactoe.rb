INITIAL_MARKER = ' '
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  clear_screen
  puts ""
  puts "1    |2    |3"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "4    |5    |6"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "7    |8    |9"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop: enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def update_board!(board, marker, position)
  board[position] = marker
  display_board(board)
end

def choose_marker(board)
  marker = ''
  loop do
    prompt "Choose your marker: X or O"
    marker = gets.chomp.upcase
    break if ['X', 'O'].include?(marker)
    display_board(board)
    prompt "Please enter a valid marker."
  end
  marker
end

def assign_comp_marker(player_marker)
  player_marker == 'X' ? 'O' : 'X'
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def players_turn(board, marker)
  position = ''
  loop do
    prompt "Choose a square. (#{empty_squares(board).join(', ')})"
    position = gets.chomp.to_i
    break if empty_squares(board).include?(position)
    display_board(board)
    prompt "Invalid square, please choose an empty square."
  end
  update_board!(board, marker, position)
end

def computers_turn(board, marker)
  position = empty_squares(board).sample
  update_board!(board, marker, position)
  prompt "Computer (#{marker}) played square #{position}."
end

def board_full?(board)
  empty_squares(board).empty?
end

def winner?(board, player_marker, comp_marker)
  WINNING_LINES.each do |row|
    return "Player" if row.all? { |num| board[num] == player_marker }
    return "Computer" if row.all? { |num| board[num] == comp_marker }
  end
  false
end

def determine_winner(winner)
  if winner
    prompt "#{winner} won!"
  else
    prompt "It's a Tie!"
  end
end

def play_again?
  answer = ''
  loop do
    prompt "Do you want to play again? (y/n)"
    answer = gets.chomp.downcase
    break if ['y', 'n'].include?(answer)
    prompt "Invalid, please enter 'y' or 'n'."
  end
  answer == 'y'
end

def clear_screen
  system("clear") || system("cls")
end

# main game
prompt "Welcome! Let's play some tic tac toe!"
# main loop
loop do
  board = initialize_board # blank board
  display_board(board) # output board
  # choose markers
  player_marker = choose_marker(board)
  comp_marker = assign_comp_marker(player_marker)
  loop do
    break if winner?(board, player_marker, comp_marker)
    players_turn(board, player_marker)
    break if winner?(board, player_marker, comp_marker) || board_full?(board)
    computers_turn(board, comp_marker)
  end
  determine_winner(winner?(board, player_marker, comp_marker))
  break unless play_again?
end

prompt "Goodbye, thanks for playing tic tac toe!"
