# PEDAC
=begin
# Problem
- take in a string of digits
- return the appropriate number as an integer
  - cannot use String#to_i or Integer() methods
- Assume valid unsigned input --> no input validaiton needed

# Examples/Test Cases
string_to_integer('4321') == 4321
string_to_integer('570') == 570
string_to_integer('001234570') == 1234570
string_to_integer('0') == 0
string_to_integer('000') == 0

# Data Structure(s)
Input: String
Output: Integer
Rules: Hash (individual mapping) and Logic

# Algorithm
1. Remove all leading zeros (leave 1 zero if length 1)
2. Evaluate the first character in the resulting string
3. Map that character to its appropriate integer digit representation
4. Convert it to an integer in its appropriate base-10 place
5. Repeat for all remaining digits in the string
6. Return the full integer

## Remove leading zeros
1. If string length one, do nothing
2. else, if char at index 0 is '0'
  a. remove the char and shift the remaining chars
3. Repeat until char at index 0 is not '0'
4. return the shifted string
=end
# Code
def chop_leading_zeros(str)
  loop do
    break if str.length == 1 or str[0] != '0'
    str = str[1, str.length - 1]
  end
  str
end

def string_to_integer(string)
  hash_map = {
    '0' => 0,
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
  }
  string = chop_leading_zeros(string)
  digit_array = string.chars.map { |char| char = hash_map[char] }
  sum = 0
  digit_array.reduce(0) { |sum, num| (sum * 10) + num }
end

# p chop_leading_zeros('0') == '0'
# p chop_leading_zeros('000000000') == '0'
# p chop_leading_zeros('00012345') == '12345'
# p chop_leading_zeros('00012345') == '12345'
# p chop_leading_zeros('174') == '174'

# p string_to_integer('0') #== [0]
# p string_to_integer('0') #== [0]
# p string_to_integer('12345') #== [1, 2, 3, 4, 5]
# p string_to_integer('0012345') #== [1, 2, 3, 4, 5]

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('001234570') == 1234570
p string_to_integer('0') == 0
p string_to_integer('000') == 0
