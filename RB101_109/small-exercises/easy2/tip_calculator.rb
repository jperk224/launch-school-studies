# Problem
# prompt for bill amount and tip rate
# display both the tip and the total bill
# Assume valid input, no validation needed

# Data Structure
# Inputs: Floats
# Outout: String Interpolation
# Rules: Logic


# Algorithm
# Prompt the user for the bill amount and store it
# Prompt the user for the tip percentage and store it
# Calculate the tip and store it in tip_amount
# Add the tip to the bill amount and store in total_bill
# Display tip amount and total_bill


# Code
print "What is the bill? "
bill_amount = gets.to_f.round(2)
print "What is the tip percentage? "
tip_percentage = gets.to_f

tip_amount = (bill_amount * (tip_percentage / 100)).round(2)
total_bill = bill_amount + tip_amount

puts "The tip is $#{sprintf("%.2f", tip_amount)}"
puts "The total is $#{sprintf("%.2f", total_bill)}"

# Test Cases
