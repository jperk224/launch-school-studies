# problem
# take in a string as input
# return the same string where integers spelleed out are converted to numerical representation
  # e.g. zero - 0, one - 1, two - 2, etc.


# examples
# word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


# ds/algo
# initalize a map of integer spelling to numerical representation
# convert the string argument to an array if substrings to iterate over
# in each iteration
  # check whether the substring contains a key from the mapping hash
  # if not, continue
  # if it does
    # get the starting index for the integer
    # replace the portion of the original string that spans that index + length of substring with the hash
    # value corresponding to the string


# code

require 'pry'

def numerical_replace(original_string, number_string, number_map)
  starting_index = original_string.index(number_string)
  number_length = number_string.length
  replacement_val = number_map[number_string.downcase]
  original_string[starting_index] = replacement_val if starting_index
  original_string.slice!((starting_index + 1)...(starting_index + number_length)) if starting_index
end

def word_to_digit(string)
  number_map = {
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
  string_array = string.split
  string_array.each do |substring|
    testsub = substring.gsub(/[^a-zA-Z]/, '')
    binding.pry
    if number_map.keys.include?(testsub)
      numerical_replace(string, testsub, number_map)
    end
  end
end

a = 'Please call me at five five five one two three four. Thanks.'
word_to_digit(a)
p a
