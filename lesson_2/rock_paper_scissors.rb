require 'yaml'
MESSAGES = YAML.load_file('rock_paper_scissors.yml')
LANGUAGE = 'en'

ABBREVIATIONS = { "r" => "rock",
                  "p" => "paper",
                  "sc" => "scissors",
                  "l" => "lizard",
                  "sp" => "spock" }

VALID_CHOICES = { "rock" => ['scissors', 'lizard', 'sc', 'l'],
                  "paper" => ['rock', 'spock', 'r', 'sp'],
                  "scissors" => ['paper', 'lizard', 'p', 'l'],
                  "lizard" => ['paper', 'spock', 'p', 'sp'],
                  "spock" => ['rock', 'scissors', 'r', 'sc'],
                  "r" => ['scissors', 'lizard', 'sc', 'l'],
                  "p" => ['rock', 'spock', 'r', 'sp'],
                  "sc" => ['paper', 'lizard', 'p', 'l'],
                  "l" => ['paper', 'spock', 'p', 'sp'],
                  "sp" => ['rock', 'scissors', 'r', 'sc'] }

FINAL_SCORE = 5

scores = { "player" => 0, "computer" => 0 }

# methods
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
    elsif choice == 'rules'
      clear_screen()
      prompt "rules"
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

def update_score(scores, player, computer)
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
  if scores['player'] == FINAL_SCORE
    prompt "player_grand_winner"
  elsif scores ['computer'] == FINAL_SCORE
    prompt "computer_grand_winner"
  end
end

def game_over(scores)
  scores['player'] == FINAL_SCORE || scores['computer'] == FINAL_SCORE
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

# main program
clear_screen()
prompt "welcome"
prompt "rules"
loop do # main loop
  loop do
    choice = valid_choice
    computer_choice = ABBREVIATIONS.values.sample
    clear_screen()
    display_choices(choice, computer_choice)

    display_result(choice, computer_choice)
    update_score(scores, choice, computer_choice)
    display_score(scores)
    display_winner(scores)
    break if game_over(scores)
  end
  reset_score(scores)
  break unless another_game?
end

prompt "goodbye"
