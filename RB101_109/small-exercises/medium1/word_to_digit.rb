# problem
# take in a sentence string as input
# return the same string (mutated)
  # any sequence numbers spelled out (i.e. zero through nine) converted to a string of digits

# examples
#p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
#p word_to_digit('Please call me five.') == 'Please call me five.'
#p word_to_digit('') == ''
#p word_to_digit(' ') == ' '
#p word_to_digit('abcde') == 'abcde'

# ds/algo
# initialize a map, mapping the word represnetation of digits 1-9 to their string integer equivalents
# get the length of the original string
# initialize an empty copy string
# convert the copy into an array of substrings
# iterate over the substrings
# if a substring is an integer spelled out and is in a sequence, replace it with the int representation
# else, leave the substring as is
# inject the iteration result into the copy
# cut the original string out of the string argument and inject the copy, mutating the original string

# code
require 'pry'
def word_to_digit(string)
  int_map = {
    'zero' => '0',
    'one' => '1',
    'two' => '2',
    'three' => '3',
    'four' => '4',
    'five' => '5',
    'six' => '6',
    'seven' => '7',
    'eight' => '8',
    'nine' => '9'
  }
  copy = ''
  string_array = string.split
  string_array.each_with_index do |substring, index|
    binding.pry
    if int_map.keys.include?(substring) && (int_map.keys.include?(string_array[index - 1]) || int_map.keys.include?(string_array[index + 1]))
      copy << int_map[substring]
    else
      copy << substring
    end
    copy << ' '
  end
  string.slice!(0...string.length)
  string << copy.slice!(0...copy.length - 1)
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
