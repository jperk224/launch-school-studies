# problem
# double is a number that
  # even number of digits
  # left side digits are exactly the same as it's right side
# take in an int
  # return 2x the number provied unless it a double, then just return the number
# assume number is positive, greatert than equal to 0

# examples
#p twice(37) == 74
#p twice(44) == 44
#p twice(334433) == 668866
#p twice(444) == 888
#p twice(107) == 214
#p twice(103103) == 103103
#p twice(3333) == 3333
#p twice(7676) == 7676
#p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
#p twice(5) == 10
#p twice(0) == 0

# ds/algo
# is_double?
# convert num into an array of it's digits 
# if array length is odd, retunr false
# else find midpoint of array (length / 2)
# initilaize two variable left_half, right_half
# left_half = num array from 0 up to midpoint (not including it)
# right_half everything from midpioint to end of array
# test whether left_half == right_half

# twice
# return number if double
# else retrun double number

# code
def is_double?(num)
  digit_array = num.digits.reverse
  length = digit_array.length
  return false if length.odd?
  midpoint = length / 2
  left_half = digit_array[0...midpoint]
  right_half = digit_array[midpoint...digit_array.length]
  left_half == right_half
end

def twice(num)
  if is_double?(num)
    num
  else
    num * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
p twice(0) == 0
