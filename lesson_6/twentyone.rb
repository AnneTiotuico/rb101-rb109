CARD_VALUES = ('2'..'10').to_a.append('J','Q','K','A')
SUITS = ['D', 'C', 'H', 'S']
DECK = SUITS.product(CARD_VALUES)

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
  puts "Dealer's hand: [#{dealer_cards[0]}, ? ]"
  puts "Your hand: #{player_cards}"
  display_total(player_cards)
end

def display_total(player_cards)
  total = calculate_cards_total(player_cards)
  puts "Your total: #{total}"
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
    puts "hit or stay?"
    answer = gets.chomp
    break if answer == "stay" || busted?(player_cards)
    clear_screen
    puts "You chose to hit!"
    player_cards << (deal_cards(deck, 1).flatten)
    display_dealt_cards(dealer_cards, player_cards)
    break if answer == "stay" || busted?(player_cards)
  end

  if busted?(player_cards)
    puts "Dealer won!"
  else
    puts "You chose to stay!"
  end

end

# def dealer_turn(cards)
#   loop do
#     break if hand_total >= 17 || bust?
#     prompt "Dealer hit"
#   end
# end

def clear_screen
  system("clear") || system("cls")
end


# main game

loop do
  deck = DECK.dup
  player_cards = deal_cards(deck)
  dealer_cards = deal_cards(deck)
  display_dealt_cards(dealer_cards, player_cards)
  player_turn(player_cards, deck, dealer_cards)
  break
end