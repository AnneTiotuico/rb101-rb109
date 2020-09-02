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

def get_lang()
  lang_choice = ''
  loop do
    puts messages('language', lang='en')
    lang_choice = gets.chomp
    break if %w(en es fil).include?(lang_choice)
  end
  lang_choice
end

def get_name(lang)
  name = ''
  loop do
  name = gets.chomp

    unless /^[[:alpha:]]+$/.match(name)
      prompt 'invalid_name', lang
    else
      break
    end
  end
  name
end

def number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
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

# ------------ main program ------------
system("clear") || system("cls")

lang = get_lang()

prompt 'welcome', lang

name = get_name(lang)

puts format(messages('greeting', lang), name: name)


#  ------------ main loop ------------
loop do
  number1 = ''
  loop do
    prompt 'first_number', lang
    number1 = gets.chomp

    if number?(number1)
      break
    else
      prompt 'not_valid_number', lang
    end
  end

  number2 = ''
  loop do
    prompt 'second_number', lang
    number2 = gets.chomp

    if number?(number2)
      break
    else
      prompt 'not_valid_number', lang
    end
  end

  prompt 'operator_prompt', lang
  operator = ''
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

  puts format(messages('operation', lang),
              operation: operation_to_message(operator, lang),
              number1: number1,
              number2: number2)

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

  puts format(messages('result', lang), result: result)

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
  break if answer.downcase == 'n'
  system("clear") || system("cls")
  prompt 'again', lang
end

prompt 'goodbye', lang
