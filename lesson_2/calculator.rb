require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

LANGUAGE = 'en'

# methods
def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts("=> #{message}")
end

def get_name()
  name = ''
  loop do
  name = gets.chomp

    unless /^[[:alpha:]]+$/.match(name)
      prompt 'invalid_name'
    else
      break
    end
  end
  name
end

def number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def operation_to_message(op)
  operation = case op
         when '1'
          messages('adding', LANGUAGE)
         when '2'
          messages('subtracting', LANGUAGE)
         when '3'
          messages('multiplying', LANGUAGE)
         when '4'
          messages('dividing', LANGUAGE)
         end
  operation
end

# main program

prompt 'welcome'

name = get_name()

puts format(messages('greeting', LANGUAGE), name: name)

loop do # main loop
  number1 = ''
  loop do
    prompt 'first_number'
    number1 = gets.chomp

    if number?(number1)
      break
    else
      prompt 'not_valid_number'
    end
  end

  number2 = ''
  loop do
    prompt 'second_number'
    number2 = gets.chomp

    if number?(number2)
      break
    else
      prompt 'not_valid_number'
    end
  end

  prompt 'operator_prompt'
  operator = ''
  loop do
    operator = gets.chomp

    if operator == '4' && number2 == '0'
      prompt 'zero_division_error'
    elsif %w(1 2 3 4).include?(operator)
      break
    else
      prompt 'valid_operator'
    end
  end

  puts format(messages('operation', LANGUAGE), operation: operation_to_message(operator))

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

  puts format(messages('result', LANGUAGE), result: result)

  prompt 'another_calculation'
  answer = ''
  loop do
    answer = gets.chomp
    if answer.downcase == 'y' || answer.downcase == 'n'
      break
    else
      prompt 'invalid_continue'
    end
  end
  break if answer.downcase == 'n'
  system("clear") || system("cls")
end

prompt 'goodbye'
