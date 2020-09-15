# problem
# take in an int
# return the maximum rotation
  # the final 2 gitst have been rotated and the next iteration would just 'rotate' a single digit


# examples
# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
#p max_rotation(8_703_529_146) == 7_321_609_845

# ds/algo
# rotate right most digits (int, n)
  # convert the int into an array of individual digits
  # split the array based on n into left_array and right_array
  # rotate right_array
  # joint left_array and right_array
  # convert the resulting array back to int

# max_rotation
  # initalize a counter set equal to number of digits in the int argument
  # call rotate_right_most_digits with arguments int counter
  # store result in new_int variable
  # reduce counter by 1
  # call rotate_right_most_digits with arguments new_int and counter
  # repeat until counter < 2

# code
def rotate_rightmost_digits(int, n)
  num_array = int.digits.reverse
  left_array = num_array[0...-n]
  right_array = num_array[-n..-1]
  right_array.rotate!
  result_array = left_array + right_array
  result_array.join.to_i
end

def max_rotation(int)
  counter = int.digits.length
  new_int = int
  loop do
    break if counter < 2
    new_int = rotate_rightmost_digits(new_int, counter)
    counter -= 1
  end
  new_int
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
