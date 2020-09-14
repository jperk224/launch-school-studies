# problem
# take in a non-empty string argument
# return the middle of the argument
  # one char is argument is odd length
  # two chars if argument is even length

# examples
# p center_of('I love ruby') == 'e'
# p center_of('Launch School') == ' '
# p center_of('Launch') == 'un'
# p center_of('Launchschool') == 'hs'
# p center_of('x') == 'x'

# ds/algo
# initialize midpoint and set equal to truncated division of string length - 2
# return character at index midpoint if string length is odd
# return slice beginning at midpoint with length 2 is string length is even

# code
def center_of(string)
  length = string.length
  midpoint = length / 2
  case
  when length.odd?
    string[midpoint]
  else
    string[midpoint - 1, 2]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
