# PEDAC
=begin
# Problem
- take in an array of numbers
- return array with same number of elements
- each element is a running total of the elements up to that point

# Example
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
running_total([-10, 12, 5, -15]) = [-10, 2, 7, -8]

# Data Structure
Input: Array
Output: Array
Rules: Logic

# Algorithm
- initalize a 'sum' variable to 0
- initialize an empty 'running_totals' array
- for each element in the array
  - add it to 'sum'
  - push the 'sum' to the end of the array
- return 'running_totals' array

=end
# code

def running_total(arr)
  sum = 0
  running_totals = []
  # arr.each do |num|
  #   sum += num
  #   running_totals << sum
  # end
  # running_totals

  # arr.each_with_object(running_totals) do |num, obj|
  #   obj << sum += num
  # end

  arr.reduce(0) do |sum, num| 
    running_totals << sum + num
    sum + num
  end
  running_totals
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
p running_total([-10, 12, 5, -15]) == [-10, 2, 7, -8]
