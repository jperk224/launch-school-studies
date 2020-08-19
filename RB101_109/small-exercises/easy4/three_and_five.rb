# PEDAC
=begin
# Problem
- Method to find all multiples of 3 and 5 between 1 and the given number
- sum those multiples
- no input validaiton, safe to assume positive integer input

# Examples/Test Cases
multisum(20) == 98
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

# Data Structure(s)
Input: Integer
Output: Integer
Rules: Array and Logic

# Algorithms
For each number in the range b/t 1 and the number given
  - check whether its a multiple of 3 or 5
    - if so, add it to the array
    - sum the value on the array

=end

# Code
# def multisum(num)
#   multiples_array = []
#   for number in (1..num)
#     multiples_array << number if (number % 3 == 0 || number % 5 == 0)
#   end
#   multiples_array.sum
# end

# Further exploration using inject
def multisum(num)
  (1..num).to_a.select { |num| num if num % 3 == 0 || num % 5 == 0 }.inject(:+)
end

p multisum(20) == 98
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
