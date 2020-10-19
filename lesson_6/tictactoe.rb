require 'pry'
INITIAL_MARKER = ' '
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
FINAL_SCORE = 5
scores = { "player" => 0, "computer" => 0 }

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

def joinor(arr, delimiter= ', ', word='or')
  if arr.length < 3
    arr.join(" #{word} ")
  else
    arr.join(delimiter).insert(-2, "#{word} ")
  end
end

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

def valid_integer?(num)
  num.to_i.to_s == num
end

def players_turn(board, player_marker)
  position = ''
  loop do
    prompt "Choose a square. (#{joinor(empty_squares(board))})"
    position = gets.chomp
    break if empty_squares(board).include?(position.to_i) && valid_integer?(position)
    display_board(board)
    prompt "Invalid square, please choose an empty square."
  end
  update_board!(board, player_marker, position.to_i)
end

def two_in_a_row(board, player_marker, comp_marker)
  win_lines = WINNING_LINES.dup
  win_lines.map do |row|
    return row if row.count { |square| board[square] == player_marker } == 2 && at_risk_square?(board, row)
  end
  false
end

def at_risk_square?(board, row)
  board.values_at(*row).include?(INITIAL_MARKER)
end

def computers_turn(board, comp_marker, player_marker)
  position = ''
  row = two_in_a_row(board, player_marker, comp_marker)
  p row
  if row
    position = row.select { |square| square if board[square] == INITIAL_MARKER }[0]
  else
    position = empty_squares(board).sample # computer chooses random empty square
  end
  update_board!(board, comp_marker, position)
  prompt "Computer (#{comp_marker}) played square #{position}."
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
    prompt "#{winner} won this round!"
  else
    prompt "It's a Tie!"
  end
end

def update_score(board, scores, player_marker, comp_marker)
  winner = winner?(board, player_marker, comp_marker)
  if winner == "Player"
    scores['player'] += 1
  elsif winner == "Computer"
    scores['computer'] += 1
  end
end

def display_score(scores)
  prompt "Player: #{scores['player']} | Computer: #{scores['computer']}"
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

def game_over?(scores)
  scores['player'] == FINAL_SCORE || scores['computer'] == FINAL_SCORE
end

def display_game_winner(scores)
  display_score(scores)
  if scores['player'] == FINAL_SCORE
    prompt "Congrats! You won the game!"
  elsif scores['computer'] == FINAL_SCORE
    prompt "The computer won this game."
  end
end

def reset_score(scores)
  scores['player'] = 0
  scores['computer'] = 0
end

def clear_screen
  system("clear") || system("cls")
end

# main game
prompt "Welcome! Let's play some Tic Tac Toe!"
loop do
  board = initialize_board # blank board
  display_board(board) # output board
  # choose markers
  player_marker = choose_marker(board)
  comp_marker = assign_comp_marker(player_marker)
  loop do
    board = initialize_board # blank board
    display_board(board) # output board
    display_score(scores)
    loop do
      break if winner?(board, player_marker, comp_marker)
      players_turn(board, player_marker)
      break if winner?(board, player_marker, comp_marker) || board_full?(board)
      computers_turn(board, comp_marker, player_marker)
    end
    update_score(board, scores, player_marker, comp_marker)
    determine_winner(winner?(board, player_marker, comp_marker))
    unless scores.has_value?(FINAL_SCORE)
      prompt "Next round..."
      sleep 2
    end
    break if game_over?(scores)
  end
  display_game_winner(scores)
  reset_score(scores)
break unless play_again?
end
prompt "Goodbye, thanks for playing Tic Tac Toe!"
