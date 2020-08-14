# understand the problem
=begin
- input positive integer and boolean (safe to assume clean input)
- output bonus for the given salary (1/2 if true, 0 if false)
=end

# examples/test cases
=begin
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
puts calculate_bonus(0, true) == 0
puts calculate_bonus(0, false) == 0
puts calculate_bonus(103, true) == 51
puts calculate_bonus(103) == 51
=end

# data structures
=begin
inputs - integer, boolean
output - integer
rules - logic
=end

# algorithms
=begin
if true, return half of salary, 0 otherwise
=end

# code
def calculate_bonus(salary, bool = true)
  return bool ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
puts calculate_bonus(0, true) == 0
puts calculate_bonus(0, false) == 0
puts calculate_bonus(103, true) == 51
puts calculate_bonus(103) == 51
