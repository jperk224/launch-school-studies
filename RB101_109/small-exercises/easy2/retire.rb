# Problem
# Display the year the user will retire
# Display how many years left until retirement
# Assume no data integrity issues or validaiton needed


# Data Structure
# Input(s): Integers
# Output(s): Strings interpolated with integers


# Algorithm
# Get the user's age 
# store it in user_age
# Get the user's retirement_age
# store it in retirement_age
# get the current year
# calculate year until retirement age
# get the retirment year
# display retirement year
# display years until retirement


# Code
print "What is your age? "
user_age = gets.chomp.to_i
print "At what age would you like to retire? "
retirement_age = gets.chomp.to_i
current_year = Time.now.year
retirement_year = current_year + (retirement_age - user_age)
puts "It's #{current_year}.  You will retire in #{retirement_year}."
puts "You have only #{retirement_age - user_age} years of work to go!"

# Examples/Test Cases
