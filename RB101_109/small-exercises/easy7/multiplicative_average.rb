=begin
# problem
- take in an array of integers
- multiply all the integers together
- divide the result by the length of the array
- round the result to 3 decimal places

# examples/testcases
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# data strucutre(s)
input: array
output: float to 3 digit precision

# algorithm(s)
reduce the array through multiplicaiton
divide the result by the array length
round the result to 3 decimals
=end
# code
def show_multiplicative_average(array)
  multiplicative_result = array.reduce(:*).to_f
  result = (multiplicative_result / array.length)
  "The result is #{format('%.3f', result)}"
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
