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
def prompt(str)
  puts "=> #{str}"
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
  break  
end
