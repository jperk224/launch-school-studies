# problem
# take in a string
# return a list of all substrings of the string
  # ordered by where in the string the substring begins, 0 then 1, then 2, etc.
  # substrings at a given position should be returned from shortest to longest

# examples/tests
=begin
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
=end
# ds/algo
# substrings at an individual position
  # take in the substring from the given position to the end of the string (this is a string itself)
  # initialize an empty array substrings
  # initialize a counter set equal to zero
  # inject substrings array with substring from 0 to counter
  # repeat by steps of one char until end of string
  # return substrings (array)
# all substrings
  # initialize an empty array final_list
  # convert the string argument into an array of chars to iterate over
  # pass the string comprised of the first element in the string through the end into leading_substrings
  # inject the result into final_list
  # advance one char and repeat
  # repeat until end of string is reached
  # remove all the nested arrays within final_list (convert it to a single array)
  # return final_list

# code
def leading_substrings(str)
  substrings = []
  counter = 0
  loop do
    substrings << str[0..counter]
    counter +=1
    break if counter >= str.length
  end
  substrings
end

def substrings(str)
  final_list = []
  string_as_chars = str.chars
  string_as_chars.each_with_index do |_, idx|
    final_list << leading_substrings(str[idx..(str.length - 1)])
  end
  final_list.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
p substrings('') == []
p substrings('') == []
p substrings('123') == ['1', '12', '123', '2', '23', '3']
