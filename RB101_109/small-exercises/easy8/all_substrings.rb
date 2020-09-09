# problem
# take in a string
# return an array of all substrings within that string
  # ordered by where in the string the substring begins
    # substrings at pos 0 before all at pos 1 before all at pos2, etc
      # substrings at each position should be ordered from shortest to longest

# examples
=begin
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
substrings ('') == []
=end

# ds/algo
# initialize an empty array final_list
# convert the string into an array of characters string_array
# for the first character, send it to leading_substrings() and append the result to final_list
# repeat for each char in the string_array
# flatten the final_list (it should already be sorted as required here)

## leading substrings
# initialize an empty_array result
# convert the string into an array of characters
# append the firt element to result array joined as string
# append the first and second element to result array joined as string
# repeat for every element in the string
# return sorted result

# code
def leading_substrings(string)
  result = []
  string_array = string.chars
  string_array.each_with_index do |_, idx|
    result << string_array[0..idx].join
  end
  result.sort
end

def substrings(string)
  final_list = []
  string_array = string.chars
  string_array.each_with_index do |_, idx|
    final_list << leading_substrings(string_array[0..idx].join)
  end
  final_list.flatten
end

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
substrings ('') == []