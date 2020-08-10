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
  (float?(str) || integer?(str))
end

# get numerical input from the user, validate it
# and return it to store in a variable
def get_user_number(type, prompt, error_message=MESSAGES["default_bad_entry"])
  user_input = ''
  loop do
    prompt(prompt)
    user_input = gets.chomp
    valid_entry = false
    case type
    when 'loan', 'duration'
      if !valid_number?(user_input) || !((user_input.to_i > 0) || (user_input.to_f > 0))
        prompt(error_message)
      else
        valid_entry = true
      end
    when 'apr'
      if !valid_number?(user_input) || !((user_input.to_i >= 0) || (user_input.to_f >= 0))
        prompt(error_message)
      else
        valid_entry = true
      end
    end
    break if valid_entry
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
  amount = get_user_number('loan', MESSAGES["get_loan_amount"], MESSAGES["bad_loan_entry"])
  apr = get_user_number('apr', MESSAGES["get_apr"], MESSAGES["bad_apr_entry"])
  duration = get_user_number('duration', MESSAGES["get_duration"], MESSAGES["bad_duration_entry"])
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
