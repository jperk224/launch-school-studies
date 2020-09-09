# problem
# take in an array of numbers
# retun the sum of sums of each leading sequence for that array
# assume array always contains at least 1 number

# examples
# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([0]) == 0
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

# ds/algo
# initialize an zero sum variable
# iterate over the argument array
# establish a range from 0 up to and including the index number of that element
  # step through the range grabbing each element at the respective index in the range
  # sum up the values
  # increment the sum variable by the result
# repeat for all elements in the array argument
# return sum


# code
def sum_of_sums(arr)
  sum = 0
  arr.each_with_index do |num, index|
    sum += arr[0..index].sum
  end
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([0]) == 0
p sum_of_sums([1, 2, 3, 4, 5]) == 35
