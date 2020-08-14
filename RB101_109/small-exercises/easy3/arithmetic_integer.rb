# Problem
# Input: 2 integers from user
# Output: Strings representing arithmetic operaitons of those integers
  # addition
  # subtraction
  # multiplication
  # division
  # remainder
  # power
# not input validation needed

# Examples
=begin
==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103
=end

# Data Structures
# Input: Integers
# Output: Strings interpolated with integers

# Algorithm
# Get the first integer from the user
# Get the second integer form the user
# Output the arithmetic operations

# Code
puts "==> Enter the first number:"
first_number = gets.chomp.to_i
puts "==> Enter the second number"
second_number = gets.chomp.to_i
puts "==> #{first_number} + #{second_number} = #{first_number + second_number}"
puts "==> #{first_number} - #{second_number} = #{first_number - second_number}"
puts "==> #{first_number} * #{second_number} = #{first_number * second_number}"
puts "==> #{first_number} / #{second_number} = #{first_number / second_number}"
puts "==> #{first_number} % #{second_number} = #{first_number % second_number}"
puts "==> #{first_number} ** #{second_number} = #{first_number ** second_number}"
