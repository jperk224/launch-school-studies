# PEDAC
=begin
# Problem
- Given a string of digits convert it into the appropriate signed integer
  - if leading '+', integer is positive, if leading '-' integer is negative
  - if no leading '+' or '-', default to positive integer
- Assume valid input, no input validaiton needed
- may not use Integer() or String#to_i

# Examples/Test Cases
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100
string_to_signed_integer('000') == 0
string_to_signed_integer('000') == 0
string_to_signed_integer('000') == 0
string_to_signed_integer('-0000') == 0


# Data Structure(s)
Input: String
Output: Integer
Logic: Mapping hash and logic

# Algorithm
0. Get the string without sign representation (set sign aside for later)
1. Remove leading zeros
2. Map the first digit to its integer counterpart (via the hash)
3. Repeat for all digits
4. Convert the first digit to it's base-10 equivalent
5. Repeat for all digits
6. Return the resulting integer
7. Evaluate the sign of the original string and return the resulting integer signedness

## Remove leading zeros
1. if string length > 1
  a. check whether char at index 0 = '0'
    1. if so, chop it off
    2. shift the chars
  b. repeat until char at index 0 !- '0' or string length = 1

=end
# Code
def remove_leading_zeros(str)
  loop do
    break if str.length <= 1 || str[0] != '0'
    str = str[1, str.length - 1]    
  end
  str
end

def string_to_signed_integer(string)
  digit_map = {
    '0' => 0,
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9
  }

  sign = string[0]  # get the sign to reference later for signdness
  case sign
  when '+', '-'
    string = string[1, string.length - 1]
  else
    string = string
  end

  string = remove_leading_zeros(string)

  digit_array = string.chars.map { |char| char = digit_map[char] }

  resulting_integer = digit_array.reduce(0) { |sum, digit| (sum * 10) + digit }
  if sign == '-' && resulting_integer > 0
    resulting_integer *= -1
  end
  resulting_integer
end

# p remove_leading_zeros('12345') == '12345'
# p remove_leading_zeros('0') == '0'
# p remove_leading_zeros('0000000') == '0'
# p remove_leading_zeros('012345') == '12345'
# p remove_leading_zeros('012000') == '12000'
# p remove_leading_zeros('00002345') == '2345'

# p string_to_signed_integer('123') == 123
# p string_to_signed_integer('+123') == 123
# p string_to_signed_integer('-123') == -123
# p string_to_signed_integer('000000000') == 0
# p string_to_signed_integer('-00000') == 0
# p string_to_signed_integer('+00000') == 0

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
p string_to_signed_integer('000') == 0
p string_to_signed_integer('000') == 0
p string_to_signed_integer('000') == 0
p string_to_signed_integer('-0000') == 0
