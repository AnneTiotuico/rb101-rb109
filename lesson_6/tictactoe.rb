def display_board(brd)
  clear_screen()
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

def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = ' '} #{1=> ' ', 2=> ' '...etc}
  new_board
end

def update_board(board, marker, position)
  board[position] = marker
  display_board(board)
end

def choose_marker(board)
  marker = ''
  loop do
    puts "Choose your marker: X or O"
    marker = gets.chomp.upcase
    break if ['X', 'O'].include?(marker)
    display_board(board)
    puts "Please enter a valid marker."
  end
  marker
end

def assign_comp_marker(player_marker)
  player_marker == 'X' ? 'O' : 'X'
end

def players_turn(board, marker)
  position = ''
  loop do
    puts "Which box would you like to mark? (1-9)"
    position = gets.chomp
    break if ('1'..'9').include?(position) && board[position.to_i] == ' '
    display_board(board)
    puts "Invalid box, please choose an empty box between 1-9."
  end
  update_board(board, marker, position.to_i)
end

def computers_turn(board, marker)
  position = 0
  loop do
    position = (1..9).to_a.sample
    break if board[position] == ' '
  end
  update_board(board, marker, position)
  puts "Computer played box #{position}. Your turn."
end

def board_full?(board)
  board.values.all? { |marked| ['X', 'O'].include?(marked) }
end

def three_in_a_row?(board)
  win_row = [[1, 2, 3], [4,5,6], [7,8,9], [1, 4, 7],
          [2, 5, 8], [3, 6, 9], [1, 5, 9], [3,5,7]]
  win_row.map do |row|
    return row if row.all? {|num| board[num] == 'X'}
    return row if row.all? {|num| board[num] == 'O'}
  end.any?
  return false
end

def determine_winner(board, winning_row)
  if winning_row
    if board[winning_row[0]] == 'X'
      puts "X wins!"
    else
      puts "O wins!"
    end
  else
    puts "Tie!"
  end
end

def play_again?(board)
  answer = ''
  loop do
    puts "Do you want to play again? (y/n)"
    answer = gets.chomp.downcase
    break if ['y', 'n'].include?(answer)
    puts "Invalid, please enter 'y' or 'n'."
  end
  answer == 'y' ? true : false
end

def clear_screen
  system("clear") || system("cls")
end

#main game
puts "Welcome! Let's play some tic tac toe!"


#main loop
loop do
  board = initialize_board # blank board
  display_board(board) # output board
  #choose markers
  player_marker = choose_marker(board)
  comp_marker = assign_comp_marker(player_marker)
  loop do
    break if three_in_a_row?(board)
    players_turn(board, player_marker)
    break if three_in_a_row?(board) || board_full?(board)
    computers_turn(board, comp_marker)
  end
  determine_winner(board, three_in_a_row?(board))
  break unless play_again?(board)
end

puts "Goodbye, thanks for playing!"