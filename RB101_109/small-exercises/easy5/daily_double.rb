=begin
# Problem
- take in a string
- return a NEW string
  - the original string with all consecutive characters collapsed into a single character
  - can not use #squeeze
  - can not use #squeeze!
# Examples
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

# Data Structure
input: string
output: string
rules: logic/array

# Algorithm
1. initialize an empty string_array array
2. isolate a character in the string
3. append it to string_array if last element in string_array is not the same character
4. join string_array
5. return the array
=end
# Code
def crunch(string)
  string_array = []
  string.chars.each do |char|
    string_array << char unless string_array.last == char
  end
  string_array.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
p crunch('   abccdd d dd   ') == ' abcd d d '
