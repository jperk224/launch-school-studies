# PEDAC
=begin
# Problem
- Take in a string
- return the ASCII value of the string argument (integer)
  - The ASCII string value is the sum of the individual ASCII values
  of each character in the string
- May use String#ord to determine the ASCII value
  - This method returns the integer ordinal of a one-character string

# Examples/Test Cases
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

# Data Structures
Input: String
Output: Integer
Rules: Arrays with logic

# Algorithms
1. convert the string argument into an individual array of characters
2. convert the array of chars into an array of their ASCII representations
3. sum the elements in the ASCII array
4. Return the sum

=end
# code
def ascii_value(string)
  ascii_array = string.chars.map { |char| char.ord }
  ascii_array.sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
