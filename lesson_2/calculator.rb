require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

#  ------------ methods  ------------
def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key, lang)
  message = messages(key, lang)
  puts("=> #{message}")
end

def get_lang
  lang_choice = ''
  loop do
    puts messages('language', 'en')
    lang_choice = gets.chomp.downcase
    break if %w(en es fil).include?(lang_choice)
  end
  lang_choice
end

def valid_name?(name)
  if /^[[:alpha:]]+$/.match(name) || /^[[:alpha:]]+ [[:alpha:]]+$/.match(name)
    true
  end
end

def get_name(lang)
  name = ''
  loop do
    name = gets.chomp
    if valid_name?(name)
      break
    else
      prompt 'invalid_name', lang
    end
  end
  name
end

def number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def get_num(num_order, lang)
  number = ''
  loop do
    prompt num_order, lang
    number = gets.chomp

    if number?(number)
      break
    else
      prompt 'not_valid_number', lang
    end
  end
  number
end

def get_operator(lang, number2)
  operator = ''
  prompt 'operator_prompt', lang
  loop do
    operator = gets.chomp
    if operator == '4' && number2 == '0'
      prompt 'zero_division_error', lang
    elsif %w(1 2 3 4).include?(operator)
      break
    else
      prompt 'valid_operator', lang
    end
  end
  operator
end

def operation_to_message(op, lang)
  operation = case op
              when '1'
                messages('adding', lang)
              when '2'
                messages('subtracting', lang)
              when '3'
                messages('multiplying', lang)
              when '4'
                messages('dividing', lang)
              end
  operation
end

def calculate_result(number1, number2, operator)
  result = case operator
           when '1'
             number1.to_f + number2.to_f
           when '2'
             number1.to_f - number2.to_f
           when '3'
             number1.to_f * number2.to_f
           when '4'
             number1.to_f / number2.to_f
           end
  result
end

def continue(lang)
  prompt 'another_calculation', lang
  answer = ''
  loop do
    answer = gets.chomp
    if answer.downcase == 'y' || answer.downcase == 'n'
      break
    else
      prompt 'invalid_continue', lang
    end
  end
  answer
end

def clear_screen
  system("clear") || system("cls")
end

# ------------ main program ------------
clear_screen()

lang = get_lang()
prompt 'welcome', lang
name = get_name(lang)
puts format(messages('greeting', lang), name: name)

#  ------------ main loop ------------
loop do
  number1 = get_num('first_number', lang)
  number2 = get_num('second_number', lang)
  operator = get_operator(lang, number2)

  puts format(messages('operation', lang),
              operation: operation_to_message(operator, lang),
              number1: number1,
              number2: number2)

  result = calculate_result(number1, number2, operator, lang)

  puts format(messages('result', lang), result: result)

  answer = continue(lang)
  break if answer.downcase == 'n'
  clear_screen()
  prompt 'again', lang
end

prompt 'goodbye', lang
