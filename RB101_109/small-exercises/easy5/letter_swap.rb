# PEDAC
=begin
# Problem
- A take a string and return a string where
  - the first and last letter of each word in the string are swapped

- No data validation/input needed
  - Assume every word contains at least one letter
  - the input string will always contain at least one word
  - Each string contains nothing but words and spaces

# Examples/Test Cases
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

# Data Structure
Input: String
Output: String
Rules: Array and logic

# Algorithms
1. split the string into an array of substrings
2. for each substring
  a. convert to an array of chars
  b. swap index 0 w. index -1
  c. join the cars back together
3. join back the larger array of substrings

=end
# Code
def swap(string)
  string.split.map do |substring|
    char_array = substring.chars
    temp_val = char_array[0]
    char_array[0] = char_array[-1]
    char_array[-1] = temp_val
    char_array.join
  end.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
