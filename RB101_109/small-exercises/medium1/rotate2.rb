# problem
# write a method that can rotate the last n digits of a number

# examples
# p rotate_rightmost_digits(735291, 0) == 735291
# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917
# p rotate_rightmost_digits(-735291, 6) == -352917

# ds/algo
# covert the int argument into an array of individual digits
# split the array into two sub arrays
  # based on argument n (dictates size of right most array)
# rotate the right subarray
# join the arrays back together
# convert the joined array back to an integer
# return the integer 

# code
def rotate_rightmost_digits(int, n)
  return int if n == 0
  num = int
  num = num *= -1 if int < 0
  digits = num.digits.reverse
  left_array = digits[0...-n]
  right_array = digits[-n..-1]
  right_array.rotate!
  new_digits = left_array + right_array
  result = new_digits.join.to_i
  if int < 0
    result *= -1
  else
    result
  end
end

p rotate_rightmost_digits(735291, 0) == 735291
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
p rotate_rightmost_digits(-735291, 6) == -352917
