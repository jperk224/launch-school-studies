# problem
# take in an array of integers
# multiplies all the numbers in the array
# divide the result by the number of array entries
# prints the result to 3 decimal places
# assume array is not empty


# examples
=begin
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
=end

# ds/algo
# multiply all the numbers in the array
# divide the result by the length of the array
# format the result rounded to 3 decimal places 
# output the formatted result

# code
def show_multiplicative_average(arr)
  average = (arr.reduce(:*)) / arr.length.to_f
  format('%.3f', average)
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
