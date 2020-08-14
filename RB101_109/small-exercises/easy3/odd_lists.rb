# Problem
# Input: Array
# Output: Array of odd numbered (but even-indexed) elements


# Data Structure
# Input: Array
# Output: Array of odd numbered (but even-indexed) elements

# Algorithm
# take in an array
# return an array of just even indexed elements

# Code 
def oddities(arr)
  arr.select { |num| arr.index(num).even? }
end

def eventies(arr)
  arr.select { |num| arr.index(num).odd? }
end

# Examples
puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
puts eventies([2, 3, 4, 5, 6]) == [3, 5]
