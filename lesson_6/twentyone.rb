CARD_VALUES = ('2'..'10').to_a.append('J','Q','K','A')
SUITS = ['D', 'C', 'H', 'S']
DECK = SUITS.product(CARD_VALUES)

def prompt(msg)
  puts "=> #{msg}"
end

def display_welcome
  prompt "Welcome to Twenty One! Get as close to 21 without going over."
  prompt "(Suits - D: Diamonds, C: Clubs, H: Hearts, S: Spades)"
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

def display_initial_cards(dealer_cards, player_cards)
  total = calculate_total(player_cards)
  prompt "Dealer's hand: [#{dealer_cards[0]}, ? ]"
  prompt "Your hand: #{player_cards} for a total of: #{total}"
end

def new_hand(player, cards)
  total = calculate_total(cards)
  prompt "#{player} cards are: #{cards}, for a total of #{total}"
end

def calculate_total(cards)
  values = cards.map { |card| card[1] }
  sum = 0

  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end
  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def busted?(cards)
  calculate_total(cards) > 21
end

def player_turn(player_cards, deck, dealer_cards)
  answer = ''
  loop do
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      answer = gets.chomp.downcase
      break if ['h', 'hit', 'stay', 's'].include?(answer)
      prompt "Please choose '(h)it' or '(s)tay'."
    end
    clear_screen
    if answer == 'h' || answer == 'hit'
      prompt "You chose to hit!"
      player_cards << (deal_cards(deck, 1).flatten)
      new_hand("Your", player_cards)
    end
    break if answer == "stay" || answer == 's' || busted?(player_cards)
  end
  if busted?(player_cards)
    determine_result(dealer_cards, player_cards)
  else
    prompt "You stayed at #{calculate_total(player_cards)}."
  end
end

def dealer_turn(dealer_cards, deck, player_cards)
  prompt "Dealer's turn..."
  loop do
    break if calculate_total(dealer_cards) >= 17 || busted?(dealer_cards)
    prompt "Dealer hit!"
    dealer_cards << (deal_cards(deck, 1).flatten)
    new_hand("Dealer's", dealer_cards)
  end

  if busted?(dealer_cards)
    determine_result(dealer_cards, player_cards)
  else
    prompt "Dealer chose to stay at #{calculate_total(dealer_cards)}."
    display_final_cards(dealer_cards, player_cards)
  end
end

def display_final_cards(dealer_cards, player_cards)
  dealer_total = calculate_total(dealer_cards)
  player_total = calculate_total(player_cards)
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
end

def determine_result(dealer_cards, player_cards)
  dealer_total = calculate_total(dealer_cards)
  player_total = calculate_total(player_cards)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
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
  when :player_busted then prompt "You busted! Dealer wins!"
  when :dealer_busted then prompt "Dealer busted! You win!"
  when :player then prompt "You win!"
  when :dealer then prompt "Dealer wins!"
  when :tie then prompt "It's a tie!"
  end
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

def clear_screen
  system("clear") || system("cls")
end


# main game

loop do
  clear_screen
  display_welcome
  deck = initialize_deck
  player_cards = deal_cards(deck)
  dealer_cards = deal_cards(deck)
  display_initial_cards(dealer_cards, player_cards)
  loop do
    player_turn(player_cards, deck, dealer_cards)
    break if busted?(player_cards)
    dealer_turn(dealer_cards, deck, player_cards)
    break
  end
  result = determine_result(dealer_cards, player_cards)
  display_results(result)

  break unless play_again?
end

puts "Thanks for playing Twenty One!"