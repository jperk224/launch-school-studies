# Problem
# ask the user for an integer > 0 (assume no data integrity issues or validation needed)
# ask the user to sum or product all numbers between 1 and the number given
# output the sum or product based on selection


# Data structures
# Input: Integer
# Output: Integer
# Rules: logic


# Algorithm
# get the number frm the user
# store the number in user_number
# ask the user for sum or product
# print sum_or_product() result.

#### sum_or_product ####
# Input: Integer, String
# Output: String with interpolated integer output

# Code
def sum_or_product(num, str)
  arr = (1..num).to_a
  if str == 'sum'
    arr.reduce(:+)
  else
    arr.reduce(:*)
  end
end


# Test Cases
puts sum_or_product(5, 'sum') == 15
puts sum_or_product(6, 'product') == 720
