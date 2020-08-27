=begin
# Problem
- take an array of numbers 0 to 19
- return an array of the integers sorted based on the English words for each number

# Examples
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# Data Structure
input: array
output: array
rules: logic and potential hash?

# Algorithm(s)
1. create a new array of the english word for each integer
2. sort the array
3. convert the sorted english words back to digits
4. return the array
=end
# Code
def alphabetic_number_sort(array)
  hash_map = {
    0 => 'zero',
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen'
  }
  english_array = array.map { |element| element = hash_map[element] }
  english_array.sort!
  sorted_number_array = english_array.map { |element| element = hash_map.key(element) } 
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
