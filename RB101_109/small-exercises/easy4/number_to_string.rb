# PEDAC
=begin
# Problem
- Take in an integer >= 0
- convert it to string
  - Can't use INteger#to_s or String() or Kernel#format

# Examples/Test Cases
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'


# Data Structures
Input: Integer
Output: String

# Algorithm
1. Integer % 10 to get the right most place
2. Add the result to 'digits' array
3. set new number equal to integer / 10 to chop off place just added to the array
4. Repeat steps 1 -3 until integer <= 0
5. reverse the 'digits' array
6. join the elements to create a single string
7. output the string
=end
# Code
def integer_to_string(int)
  digits_array = []
  loop do #for the case of zero ir single digit numbers we want to execute this at least once
    digits_array << int % 10
    int /= 10
    break if int <= 0
  end
  digits_array.reverse.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
p integer_to_string(5000).class

def signed_integer_to_string(int)
  if int < 0
    int = int *= -1
    "-#{integer_to_string(int)}"
  elsif int > 0
    "+#{integer_to_string(int)}"
  else
    integer_to_string(int)
  end
end

p "***** SIGNED TESTS *****"
p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
