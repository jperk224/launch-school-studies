# understand the problem
=begin
- Input => array of integers
- Output => average of all integers (Integer)
- Safe to assume array will never be empty, and always contain positive integers
=end

# Examples/Test Cases
=begin
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
puts average([1]) == 1
=end

# Data structure(s)
=begin
-input => array
- output => integer
- rules => logic
=end

# Algorithm
=begin
- sum up all numbers in the array and divide by the length of the array
=end

# Code
def average(arr)
  return arr.reduce(:+).to_f / arr.length
end

# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40
# puts average([1]) == 1

puts average([1, 6])
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])
puts average([1])
