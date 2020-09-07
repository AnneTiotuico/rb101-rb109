require 'yaml'
MESSAGES = YAML.load_file('loan_calculator.yml')
LANGUAGE = 'en'

# methods
def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts("=> #{message}")
end

def valid_number?(num)
  true if /^\d*$/.match(num) && num > '0'
end

def valid_rate?(num)
  true if /^\d*\.?\d{1,2}$/.match(num) && num > '0'
end

def format_decimals(number)
  format('%.2f', number)
end

def get_loan_amount
  loan_amount = ''
  loop do
    prompt "loan_amount"
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      break
    else
      prompt "invalid_number"
    end
  end
  loan_amount.to_i
end

def get_apr
  interest_rate = ''
  loop do
    prompt "interest_rate"
    interest_rate = gets.chomp
    if valid_rate?(interest_rate)
      break
    else
      prompt "invalid_rate"
    end
  end
  interest_rate.to_f
end

def get_loan_duration
  loan_duration_months = ''
  loop do
    prompt "loan_duration_months"
    loan_duration_months = gets.chomp
    if valid_number?(loan_duration_months)
      break
    else
      prompt "invalid_duration"
    end
  end
  loan_duration_months.to_i
end

def calculate_annual_interest_rate(apr)
  apr / 100
end

def calculate_monthly_interest_rate(annual_interest_rate)
  annual_interest_rate / 12
end

def calculate_monthly_payment(loan_amount, monthly_interest_rate, months)
  monthly_payment = loan_amount * (monthly_interest_rate /
                                  (1 - (1 + monthly_interest_rate)**(-months)))
  monthly_payment = format_decimals(monthly_payment)
  monthly_payment.to_f
end

def calculate_total_interest(loan_amount, monthly_interest_rate,
                             loan_duration_months, monthly_payment)
  outstanding = loan_amount
  total_interest = 0
  while loan_duration_months >= 0
    interest = (outstanding * monthly_interest_rate).round(2)
    outstanding -= (monthly_payment - interest)
    total_interest += interest
    loan_duration_months -= 1
  end
  format_decimals(total_interest).to_f
end

def calculate_total_payment(loan_amount, total_interest)
  loan_amount + total_interest
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

def another_calculation?
  prompt "continue"
  answer = continue()
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

# main program
clear_screen()
prompt "welcome"
loop do
  # get user loan info
  loan_amount = get_loan_amount()
  apr = get_apr()
  loan_duration_months = get_loan_duration()

  # calculations
  annual_interest_rate = calculate_annual_interest_rate(apr)
  monthly_interest_rate = calculate_monthly_interest_rate(annual_interest_rate)
  monthly_payment = calculate_monthly_payment(loan_amount,
                                              monthly_interest_rate,
                                              loan_duration_months)
  total_interest = calculate_total_interest(loan_amount,
                                            monthly_interest_rate,
                                            loan_duration_months,
                                            monthly_payment)
  total_payment = calculate_total_payment(loan_amount, total_interest)

  clear_screen()
  puts format(messages("monthly_payment"),
              amount: loan_amount,
              rate: apr,
              duration: loan_duration_months,
              monthly_payment: monthly_payment,
              months: loan_duration_months,
              total_payment: total_payment,
              total_interest: total_interest)

  break unless another_calculation?
end

prompt "goodbye"
