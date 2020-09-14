# problem
# take in a number
  # if 0 or less, return the number
  # if number is positive, return it as negative

# examples
# p negative(5) == -5
# p negative(-3) == -3
# p negative(0) == 0      # There's no such thing as -0 in ruby
# p negative(3) == -3
# p negative(32145678) == -32145678

# ds/algo
# check whether the number is positive
# is so, multiply by -1 before returning
# else, return the number

# code
def negative(num)
  case 
  when num > 0
    num * -1
  else
    num
  end
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby
p negative(3) == -3
p negative(32145678) == -32145678
