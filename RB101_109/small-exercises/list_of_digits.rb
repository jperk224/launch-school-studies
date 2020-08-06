# Undestand the problem
=begin
-input => positve integer (handle 0 or negative)
-output => array of individual digits
=end

# Examples/Test Cases
=begin
puts digit_list(12345) == [1, 2, 3, 4, 5]                     # => true
puts digit_list(7) == [7]                                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]                 # => true
puts digit_list(444) == [4, 4, 4]                             # => true
puts digit_list(0) == "Number must be positive"              # => true
puts digit_list(-17) == "Number must be positive"            # => true
puts digit_list(-1245673261) == "Number must be positive"    # => true

=end

# Data Structures
=begin
- input => integer
- output => array
=end

# Algorithm
=begin
- return message string if input <= 0
- create an empty array
- while number is > 0
  - push number mod 10 to the array
  - set number equal to number divided by 10
=end

# Code
# def digit_list(num)
#   # handle 0 or less
#   if num <= 0
#     return "Number must be positive"
#   end

#   result_array = []

#   while num > 0
#     result_array.unshift(num % 10)
#     num /= 10
#   end
#   # p result_array
#   return result_array
# end

# Alternate solution using syntactic sugar, adapted from solution provided
def digit_list(num)
  if num <= 0
    return "Number must be positive"
  end

  result_array = num.to_s.chars.map(&:to_i)

  return result_array
end

puts digit_list(12345) == [1, 2, 3, 4, 5]                     # => true
puts digit_list(7) == [7]                                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]                 # => true
puts digit_list(444) == [4, 4, 4]                             # => true
puts digit_list(0) == "Number must be positive"              # => true
puts digit_list(-17) == "Number must be positive"            # => true
puts digit_list(-1245673261) == "Number must be positive"    # => true
