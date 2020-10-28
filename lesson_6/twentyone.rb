CARD_VALUES = ('2'..'10').to_a.append('J', 'Q', 'K', 'A')
SUITS = ['D', 'C', 'H', 'S']
DECK = SUITS.product(CARD_VALUES)
FINAL_SCORE = 5
GAME_NAME = "Fifty-One"
DEALER_STAY = 47
WINNING_HAND = 51
scores = { "player" => 0, "dealer" => 0 }

def prompt(msg)
  puts "=> #{msg}"
end

def display_welcome
  puts ""
  prompt "Welcome to #{GAME_NAME}! Get as close to #{WINNING_HAND} " \
         "without going over."
  prompt "(Suits - D: Diamonds, C: Clubs, H: Hearts, S: Spades)"
  prompt "Numbers 2-10 are worth their face value."
  prompt "The (J)ack (Q)ueen and (King) are each worth 10, " \
         "the (A)ce can be worth 1 or 11."
  prompt "Player with total closest to #{WINNING_HAND} wins the round, " \
         "any totals over #{WINNING_HAND} busts."
  prompt "First player to score 5 wins, wins the game!"
  enter_to_continue
end

def initialize_deck
  DECK.shuffle
end

def deal_cards(deck, num_cards=2)
  cards = deck.sample(num_cards)
  update_deck(deck, cards)
  cards
end

def update_deck(deck, cards)
  deck.delete_if { |card| cards.include?(card) }
  deck
end

def display_initial_cards(dealer_cards, player_cards, player_total)
  clear_screen
  prompt "Dealer's hand: [#{dealer_cards[0]}, ? ]"
  prompt "Your hand: #{player_cards} for a total of: #{player_total}"
end

def hit(player, deck, cards)
  if player == "Your"
    prompt "You chose to hit!"
  elsif player == "Dealer's"
    prompt "Dealer chose to hit!"
  end
  cards << (deal_cards(deck, 1).flatten)
end

def display_new_hand(player, cards, total)
  prompt "#{player} hand: #{cards}, for a total of #{total}"
end

def calculate_total(cards)
  values = cards.map { |card| card[1] }
  sum = 0

  values.each do |value|
    sum += if value == "A"
             11
           elsif value.to_i == 0 # J, Q, K
             10
           else
             value.to_i
           end
  end
  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > WINNING_HAND
  end
  sum
end

def busted?(cards_total)
  cards_total > WINNING_HAND
end

def busted_or_stayed(player, dealer_total, player_total)
  return if busted?(player_total) || busted?(dealer_total)
  if player == 'player'
    prompt "You stayed at #{player_total}."
  elsif player == 'dealer'
    prompt "Dealer chose to stay at #{dealer_total}."
  end
end

# rubocop: disable Metrics/MethodLength
def player_turn(player_cards, deck, dealer_total, player_total)
  answer = ''
  loop do
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      answer = gets.chomp.downcase
      break if ['h', 'hit', 'stay', 's'].include?(answer)
      prompt "Please choose '(h)it' or '(s)tay'."
    end
    if answer == 'h' || answer == 'hit'
      hit("Your", deck, player_cards)
      player_total = calculate_total(player_cards)
      display_new_hand("Your", player_cards, player_total)
    end
    break if answer == "stay" || answer == 's' || busted?(player_total)
  end
  busted_or_stayed('player', dealer_total, player_total)
end
# rubocop: enable Metrics/MethodLength

def dealer_turn(dealer_cards, deck, dealer_total, player_total)
  prompt "Dealer's turn..."
  loop do
    break if dealer_total >= DEALER_STAY || busted?(dealer_total)
    hit("Dealer's", deck, dealer_cards)
    dealer_total = calculate_total(dealer_cards)
    display_new_hand("Dealer's", dealer_cards, dealer_total)
  end
  busted_or_stayed('dealer', dealer_total, player_total)
end

def determine_result(dealer_total, player_total)
  if player_total > WINNING_HAND
    :player_busted
  elsif dealer_total > WINNING_HAND
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_results(result)
  case result
  when :player_busted then "YOU BUSTED! DEALER WINS!"
  when :dealer_busted then "DEALER BUSTED! YOU WIN!"
  when :player then "CONGRATS, YOU WIN!"
  when :dealer then "SORRY, DEALER WINS!"
  when :tie then "     IT'S A TIE!     "
  end
end

def display_winner(player_cards, player_total, dealer_cards, dealer_total)
  puts "============  RESULTS ==============================================="
  display_new_hand("Your", player_cards, player_total)
  display_new_hand("Dealer's", dealer_cards, dealer_total)
  result = determine_result(dealer_total, player_total)
  puts "======> #{display_results(result)} <=================================="
end

def play_again?
  answer = ''
  prompt "Would you like to play again? (y/n)"
  loop do
    answer = gets.chomp.downcase
    break if ['y', 'n', 'yes', 'no'].include?(answer)
    prompt "Please enter 'y' or 'n',"
  end
  answer == 'y' || answer == 'yes'
end

def update_scoreboard!(scores, dealer_total, player_total)
  result = determine_result(dealer_total, player_total)

  case result
  when :player_busted, :dealer then scores["dealer"] += 1
  when :dealer_busted, :player then scores["player"] += 1
  end
end

def display_scoreboard(scores)
  prompt "Player: #{scores['player']} | Dealer: #{scores['dealer']}"
end

def pause_for_next_round
  prompt "Next round..."
  enter_to_continue
end

def enter_to_continue
  loop do
    prompt 'Please press the enter key to continue.'
    action = gets
    break if action == "\n"
    prompt "Invalid key."
  end
end

def game_over?(scores)
  scores['player'] == FINAL_SCORE || scores['dealer'] == FINAL_SCORE
end

def display_game_winner(scores)
  puts "======================================"
  if scores['player'] == FINAL_SCORE
    puts "Congrats! You won the game!"
  elsif scores['dealer'] == FINAL_SCORE
    puts "GAME OVER. The dealer won this game."
  end
  puts " ~~~~~FINAL SCORE~~~~~"
  display_scoreboard(scores)
  puts "======================================"
end

def reset_scoreboard!(scores)
  scores['player'] = 0
  scores['dealer'] = 0
end

def clear_screen
  system("clear") || system("cls")
end

# main game
clear_screen
display_welcome

loop do # game loop
  deck = initialize_deck # new deck
  loop do # round loop
    deck = initialize_deck if deck.length < 10
    player_cards = deal_cards(deck)
    dealer_cards = deal_cards(deck)
    dealer_total = calculate_total(dealer_cards)
    player_total = calculate_total(player_cards)
    display_initial_cards(dealer_cards, player_cards, player_total)

    loop do
      player_turn(player_cards, deck, dealer_total, player_total)
      player_total = calculate_total(player_cards)
      break if busted?(player_total)
      dealer_turn(dealer_cards, deck, dealer_total, player_total)
      dealer_total = calculate_total(dealer_cards)
      break
    end
    update_scoreboard!(scores, dealer_total, player_total)
    unless scores.value?(FINAL_SCORE)
      display_winner(player_cards, player_total, dealer_cards, dealer_total)
      display_scoreboard(scores)
      pause_for_next_round
    end
    break if game_over?(scores)
  end
  display_game_winner(scores)
  reset_scoreboard!(scores)
  break unless play_again?
end

prompt "Thanks for playing Twenty One!"
