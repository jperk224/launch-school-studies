# problem
# take in an int
# take the square of the sum of all the integers
# subtrat from it
  # the sum of the squares of the individual integers

# examples



# ds/algo
# make an array of all ints from 1 to n
# sum the array and square it, assign to square_of_sum
# create a new array of each element squared
  # sum it, assign to sum_of_squares
# subtract sum_of_squares from square_of_sum

# code
def sum_square_difference(n)
  num_array = (1..n).to_a
  square_of_sum = (num_array.sum)**2
  sum_of_squares = num_array.map { |num| num **2 }.sum
  square_of_sum - sum_of_squares
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
