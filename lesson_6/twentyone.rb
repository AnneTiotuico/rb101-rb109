CARD_VALUES = ('2'..'10').to_a.append('J','Q','K','A')
SUITS = ['D', 'C', 'H', 'S']
DECK = SUITS.product(CARD_VALUES)

def deal_cards(deck)
  cards = deck.sample(2)
  update_deck(deck, cards)
  cards
end

def update_deck(deck, cards)
  deck.delete_if { |card| cards.include?(card) }
  deck
end

def display_dealt_cards(player_cards, dealers_cards)
  puts "Your hand: #{player_cards}"
  puts "Dealer's hand: [#{dealers_cards[0]}, ? ]"
end

def calculate_cards_total(cards)
  values = cards.map { |card| card[1] }
  sum = 0

  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
    # correct for Aces
    values.select { |value| value == "A"}.count.times do
      sum -= 10 if sum > 21
    end
    sum
  end
end

def player_turn(cards)
  answer = ''
  loop do
    prompt "hit or stay?"
    answer = gets.chomp
    break if answer == "stay" || busted?
    prompt "You hit"
    update_cards()
  end

  if busted?
    prompt "Dealer won!"
  else
    "You chose to stay!"
  end
  cards
end

def dealer_turn(cards)
  loop do
    break if hand_total >= 17 || bust?
    prompt "Dealer hit"
  end
end


# main game

loop do
  deck = DECK.dup
  player_cards = deal_cards(deck)
  dealer_cards = deal_cards(deck)
  display_dealt_cards(player_cards, dealer_cards)
  break
end