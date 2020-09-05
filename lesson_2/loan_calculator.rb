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
  loan_amount.to_f
end

def get_apr
  interest_rate = ''
  loop do
    prompt "interest_rate"
    interest_rate = gets.chomp
    if valid_number?(interest_rate)
      break
    else
      prompt "invalid_number"
    end
  end
  interest_rate.to_f
end

def get_loan_duration
  loan_duration_years = ''
  loop do
    prompt "loan_duration_years"
    loan_duration_years = gets.chomp
    if loan_duration_years < '0' && loan_duration_years.empty?
      prompt "invalid_duration"
    else
      break
    end
  end
  loan_duration_years.to_i
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
                             months, monthly_payment)
  outstanding = loan_amount
  total_interest = 0
  while months >= 0
    interest = (outstanding * monthly_interest_rate).round(2)
    outstanding -= (monthly_payment - interest)
    total_interest += interest
    months -= 1
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
    if answer.downcase == 'y' || answer.downcase == 'n'
      break
    else
      prompt "invalid_continue"
    end
  end
  answer
end

def clear_screen
  system("clear") || system("cls")
end
# main program
loop do
  clear_screen()
  prompt "welcome"
  # get user loan info
  loan_amount = get_loan_amount()
  apr = get_apr()
  loan_duration_years = get_loan_duration()

  # calculations
  annual_interest_rate = calculate_annual_interest_rate(apr)
  monthly_interest_rate = calculate_monthly_interest_rate(annual_interest_rate)
  months = loan_duration_years.to_i * 12
  monthly_payment = calculate_monthly_payment(loan_amount,
                                              monthly_interest_rate, months)
  total_interest = calculate_total_interest(loan_amount, monthly_interest_rate,
                                            months, monthly_payment)
  total_payment = calculate_total_payment(loan_amount, total_interest)

  puts format(messages("monthly_payment"),
              monthly_payment: monthly_payment,
              months: months,
              total_payment: total_payment,
              total_interest: total_interest)

  prompt "continue"
  answer = continue()
  break if answer.downcase == 'n'
  clear_screen()
end

prompt "goodbye"
