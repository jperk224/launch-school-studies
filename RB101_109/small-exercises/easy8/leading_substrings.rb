# problem
# take in a string
# return a list of substrings
  # contians all substrings that start at the beginning of the string
  # list is sorted from shorted to longest length

# examples
#p leading_substrings('abc') == ['a', 'ab', 'abc']
#p leading_substrings('a') == ['a']
#p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
#p leading_substrings('') == []


# ds/algo
# initialize an empty array substring_list
# convert the string argument into an array of it's individual characters
# grab a the first element in the array and append it to substring_list
# grab the first and second element in the array and append it to substring_list
# repeat, incrementing chars grabbed by 1 each time, until full string is implemented

# return substring_list sorted from shortest to longest string

# code
def leading_substrings(string)
  if string.length > 0
    substring_list = []
    string_array = string.chars
    string_array.each_with_index do |_, idx|
      substring_list << string_array[0..idx].join
    end
    substring_list.sort
  else
    []
  end
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
p leading_substrings('') == []
