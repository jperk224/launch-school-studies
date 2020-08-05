# Write a method that takes one integer argument, which may be positive, 
# negative, or zero. This method returns true if the number's absolute value is odd. 
# You may assume that the argument is a valid integer value.

# PEDAC Approach

# Understand the problem
=begin
- Input: an integer (positive, negative, or zero)    
  - no exception handling needed (can assume argument is valid)
- Find the abs
- Output: true if abs is positive, false otherwise   
- Can't use #odd?
=end

# Examples/Test Cases
=begin
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
puts is_odd?(17986745321)    # => true
puts is_odd?(-17986745321)    # => true
=end

# Data Structure
=begin
Input - integer
Output - boolean
Rules - logic
=end

# Algorithm
=begin
1. Determine the abs of the integer provided
2. Check whether abs is odd, return true if odd, false otherwise
=end

# Code w/ Intent
def is_odd?(int)
  int > 0 ? int = int : int *= -1 # confirmed via solution this step was unnecessary
  return int % 2 != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
puts is_odd?(17986745321)    # => true
puts is_odd?(-17986745321)    # => true
