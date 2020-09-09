VALID_CHOICES = { "rock" => ['scissors', 'lizard'],
                  "paper" => ['rock', 'spock'],
                  "scissors" => ['paper', 'lizard'],
                  "lizard" => ['paper', 'spock'],
                  "spock" => ['rock', 'scissors'] }

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  VALID_CHOICES[first].include?(second)
end

def display_result(player, computer)
  if win?(player, computer)
    prompt "You won!"
  elsif win?(computer, player)
    prompt "Computer won!"
  else
    prompt "It's a tie!"
  end
end

def valid_continue?
  answer = ''
  loop do
    answer = gets.chomp
    break if ['y', 'n'].include?(answer.downcase)
    prompt "invalid_continue"
  end
  answer
end

def another_game?
  prompt "Do you want to play another game?"
  answer = valid_continue?
  if answer.downcase == 'n'
    false
  else
    clear_screen()
    prompt "again"
    true
  end
end

def clear_screen
  system("clear") || system("cls")
end

clear_screen()
prompt "Welcome to Rock Paper Scissors Spock! Let's play!"

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.keys.join(', ')}")
    choice = gets.chomp
    if VALID_CHOICES.keys.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.keys.sample

  puts "You chose: #{choice}; Computer chose: #{computer_choice}"

  display_result(choice, computer_choice)
  break unless another_game?
end

prompt "Thank you for playing. Good bye!"
