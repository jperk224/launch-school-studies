=begin
Given the following pieces of information
  - loan amount
  - annual percentage rate (APR)
  - loan duration
Calculate the following pieces
  - monthly interest rate
  - loan duration (in months)
  - monthly payment
=end

=begin
Examples/test cases
  - monthly_payment(amount, apr, years)
  - monthly_payment(10000, 12.00, 5) => 222.44
  - monthly_payment(0, 0, 0) => "Please provide a positive loan value."
  - monthly_payment(-10000, 3.00, 7) => "Please provide a positive loan value."
  - monthly_payment(1_000_000, 6.72, 15) => 8832.47
=end

=begin
  - loan amount => float
  - APR => float
  - duration => int
  - monthly interest rate => float
  - duration in months => int
  - monthly payment => float
  - rules => logic
=end

# Import yaml file #####
require 'yaml'
MESSAGES = YAML.load_file("payment_messages.yml")

# Methods #####
# print a message with a special prompt
def prompt(str)
  puts "=> #{str}"
end

# validate input as a valid float or int
def float?(str)
  str.to_f.to_s == str
end

def integer?(str)
  str.to_i.to_s == str
end

def valid_number?(str)
  (float?(str) || integer?(str)) && 
  ((str.to_i > 0) || (str.to_f > 0))
end

def valid_rate?(str)
  (float?(str) || integer?(str)) && 
  ((str.to_i >= 0) || (str.to_f >= 0))
end

# get numerical input from the user, validate it
# and return it to store in a variable
def get_user_number(type, prompt, error_message=MESSAGES["default_bad_entry"])
  user_input = ''
  loop do
    prompt(prompt)
    user_input = gets.chomp
    case type
    when 'loan', 'duration'
      if !valid_number?(user_input)
        prompt(error_message)
      else
        break
      end
    when 'apr'
      if !valid_rate?(user_input)
        prompt(error_message)
      else
        break
      end
    end
  end
  user_input
end

# Script #####

# Ask the user their name
name = ''
loop do
  prompt(MESSAGES["name_prompt"])
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES["invalid_name"])
  else
    break
  end  
end

prompt("#{MESSAGES["welcome"]} #{name}!")

loop do # main loop
  # get key input from user
  amount = get_user_number('loan', MESSAGES["get_loan_amount"], MESSAGES["bad_loan_entry"]).to_f
  apr = get_user_number('apr', MESSAGES["get_apr"], MESSAGES["bad_apr_entry"]).to_f
  duration = get_user_number('duration', MESSAGES["get_duration"], MESSAGES["bad_duration_entry"]).to_f

  # calculate intermediate values from user input
  monthly_interest = (apr / 12) / 100
  loan_months = duration * 12
  # monthly payment = loan_amount * (monthly_interest / (1 - (1 + monthly_interest)**(-loan_months)))
  if monthly_interest == 0.00
    monthly_payment = (amount / loan_months).round(2)
  else
    monthly_payment = (amount * (monthly_interest / (1 - ((1 + monthly_interest)**(loan_months * (-1)))))).round(2)
  end
  prompt("#{MESSAGES["payment_amount_message"]} #{monthly_payment}")

  try_again_input = ''
  loop do
    prompt(MESSAGES["calculate_another_payment"])
    try_again_input = gets.chomp.downcase
    if try_again_input != 'n' && try_again_input != 'y'
      prompt(MESSAGES["default_bad_entry"])
    else
      break
    end
  end
  break if try_again_input == 'n'
end

prompt(MESSAGES["thanks"])
