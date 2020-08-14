# Problem


# Examples


# Data Structure


# Algorithm


# Code
def multiply(num1, num2)
  num1 * num2
end

puts multiply(5, 3) == 15
# puts multiply([1, 2, 3], 4)

# SQUARE METHOD ###
def square(num)
  multiply(num, num)
end

puts square(5) == 25
puts square(-8) == 64

# POWER METHOD ###
def power_to_n(num, power)
  result = 1
  if power < 0
    power *=-1
    power.times { result *= multiply(num, 1) }
    result = 1 / result
  else
    power.times { result *= multiply(num, 1) }
    result
  end
end

puts power_to_n(2, 3) == 8
puts power_to_n(3, 2) == 9
puts power_to_n(0, 5) == 0
puts power_to_n(3, 3) == 27
puts power_to_n(2, 0) == 1
puts power_to_n(2, -3) == 1 / 8
puts power_to_n(1, -1) == 1 /1 
