# Understand the problem
=begin
- input => positive integer (safe to assume input will be greater than zero)
- output => sum of individual digits
- try to solve without a loop     
=end

# Examples/Test Cases
=begin
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45     
=end

# Data Structure
=begin
- input integer
- output integer
- rules logic/arrays     
=end

# Algorithm
=begin
-convert the number to string and split it
- convert each elemnet to int and sum them up     
=end

# Code
def sum(num)
  return num.to_s.split('').map { |string_digit| string_digit.to_i }.reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
