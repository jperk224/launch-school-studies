# Problem
# generate a random number between 20 and 200
# Input: Integer
# Output: String


# Examples
# display_teddy_age(20) => "Teddy is 20 years old!"
# display_teddy_age(69) => "Teddy is 69 years old"


# Data Structure
# Input: Random integer b/t 20 and 200 (inclusive)
# Output: String


# Algorithm
# Generate a random number between 20 and 200
# Interpolate the number into the output string


# Implementation
def display_teddy_age(num)
  puts "Teddy is #{num} years old!"
end


# Test cases
display_teddy_age(20) # => "Teddy is 20 years old!"
display_teddy_age(69) # => "Teddy is 69 years old!"
display_teddy_age(rand(20..200)) # => "Teddy is <random> years old!"
