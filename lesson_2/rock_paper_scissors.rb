require 'yaml'
MESSAGES = YAML.load_file('rock_paper_scissors.yml')
LANGUAGE = 'en'

ABBREVIATIONS = { "r" => "rock",
                  "p" => "paper",
                  "sc" => "scissors",
                  "l" => "lizard",
                  "sp" => "spock" }

VALID_CHOICES = { "rock" => ['scissors', 'lizard'],
                  "paper" => ['rock', 'spock'],
                  "scissors" => ['paper', 'lizard'],
                  "lizard" => ['paper', 'spock'],
                  "spock" => ['rock', 'scissors'],
                  "r" => ['scissors', 'lizard'],
                  "p" => ['rock', 'spock'],
                  "sc" => ['paper', 'lizard'],
                  "l" => ['paper', 'spock'],
                  "sp" => ['rock', 'scissors'] }

scores = { "player" => 0, "computer" => 0 }

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts("=> #{message}")
end

def valid_choice
  choice = ''
  loop do
    prompt "choices"
    choice = gets.chomp.downcase
    if VALID_CHOICES.keys.include?(choice)
      break
    else
      prompt "invalid_choice"
    end
  end
  choice.downcase
end

def display_choices(choice, computer_choice)
  if ABBREVIATIONS.keys.include?(choice)
    choice = ABBREVIATIONS[choice]
  end
  puts format(messages("player_choice"), choice: choice)
  puts format(messages("computer_choice"), computer_choice: computer_choice)
end

def win?(first, second)
  VALID_CHOICES[first].include?(second)
end

def display_result(player, computer)
  if win?(player, computer)
    prompt "player_won"
  elsif win?(computer, player)
    prompt "computer_won"
  else
    prompt "tie"
  end
end

def get_score(scores, player, computer)
  if win?(player, computer)
    scores['player'] += 1
  elsif win?(computer, player)
    scores['computer'] += 1
  end
end

def display_score(scores)
  puts format(messages("display_score"),
              player_score: scores['player'],
              computer_score: scores['computer'])
end

def display_winner(scores)
  if scores['player'] == 5
    prompt "player_grand_winner"
  elsif scores ['computer'] == 5
    prompt "computer_grand_winner"
  end
end

def game_over(scores)
  scores['player'] == 5 || scores['computer'] == 5
end

def continue
  answer = ''
  loop do
    answer = gets.chomp
    break if ['y', 'n'].include?(answer.downcase)
    prompt "invalid_continue"
  end
  answer
end

def another_game?
  prompt "another_game"
  answer = continue
  if answer.downcase == 'n'
    false
  else
    clear_screen()
    prompt "again"
    true
  end
end

def reset_score(scores)
  scores['player'] = 0
  scores['computer'] = 0
end

def clear_screen
  system("clear") || system("cls")
end

clear_screen()
prompt "welcome"

loop do
  loop do
    choice = valid_choice
    computer_choice = ABBREVIATIONS.values.sample
    clear_screen()
    display_choices(choice, computer_choice)

    display_result(choice, computer_choice)
    get_score(scores, choice, computer_choice)
    display_score(scores)
    display_winner(scores)
    break if game_over(scores)
  end
  reset_score(scores)
  break unless another_game?
end

prompt "goodbye"
