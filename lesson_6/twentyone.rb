CARD_VALUES = ('2'..'10').to_a.append('J','Q','K','A')
SUITS = ['D', 'C', 'H', 'S']
DECK = SUITS.product(CARD_VALUES)

def prompt(msg)
  puts "=> #{msg}"
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

def display_dealt_cards(dealer_cards, player_cards)
  prompt "Dealer's hand: [#{dealer_cards[0]}, ? ]"
  prompt "Your hand: #{player_cards}"
  display_total(player_cards)
end

def display_total(player_cards)
  total = calculate_cards_total(player_cards)
  prompt "Your total: #{total}"
end

def calculate_cards_total(cards)
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
  calculate_cards_total(cards) > 21
end

def player_turn(player_cards, deck, dealer_cards)
  answer = ''
  loop do
    prompt "hit or stay?"
    answer = gets.chomp
    break if answer == "stay" || busted?(player_cards)
    clear_screen
    prompt "You chose to hit!"
    player_cards << (deal_cards(deck, 1).flatten)
    display_dealt_cards(dealer_cards, player_cards)
    break if answer == "stay" || busted?(player_cards)
  end
  clear_screen
  if busted?(player_cards)
    prompt "You busted! Dealer won!"
  else
    prompt "You chose to stay!"
  end
end

def dealer_turn(dealer_cards, deck)
  prompt "Dealer's turn!"
  loop do
    hand_total = calculate_cards_total(dealer_cards)
    break if hand_total >= 17 || busted?(dealer_cards)
    prompt "Dealer hit"
    dealer_cards << (deal_cards(deck, 1).flatten)
  end
  if busted?(dealer_cards)
    prompt "Dealer busted! You win!"
  else
    prompt "Dealer chose to stay."
  end
end

def display_final_totals(dealer_cards, player_cards)
  dealer_total = calculate_cards_total(dealer_cards)
  player_total = calculate_cards_total(player_cards)
  prompt "Dealer Total: #{dealer_total}  Your Total: #{player_total}"
end

def determine_winner(dealer_cards, player_cards)
  dealer_total = calculate_cards_total(dealer_cards)
  player_total = calculate_cards_total(player_cards)
  if dealer_total < 22 && dealer_total > player_total
    "dealer"
  elsif player_total < 22 && player_total > dealer_total
    "player"
  else
    "tie"
  end
end

def display_final_results(winner)
  case winner
  when'dealer' then "Dealer wins!"
  when 'player' then "You win!"
  when 'tie' then "It's a tie!"
  end
end

def clear_screen
  system("clear") || system("cls")
end


# main game

loop do
  deck = DECK.dup
  player_cards = deal_cards(deck)
  dealer_cards = deal_cards(deck)
  display_dealt_cards(dealer_cards, player_cards)
  loop do
    player_turn(player_cards, deck, dealer_cards)
    break if busted?(player_cards)
    dealer_turn(dealer_cards, deck)
    break
  end
  display_final_totals(dealer_cards, player_cards)
  break if busted?(player_cards) || busted?(dealer_cards)
  winner = determine_winner(dealer_cards, player_cards)
  prompt display_final_results(winner)
  break
end

puts "Thanks for playing Twenty One!"