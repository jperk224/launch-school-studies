# problem
# take in a string
# return the next-to-last word in the string
  # words are any sequence of non-blank chars
# assum input string always contains at lease 2 words

# examples
# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

# ds/algo
# split the string into an array of individual substrings
# return the second to last substring in the array

# code
def penultimate(string)
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

def middle_word(string)
  returned_word = ''
  word_array = string.split
  length = word_array.length
  if length == 0
    returned_word
  elsif length == 1
    returned_word = string
  else
    returned_word = word_array[length / 2]
  end
end

p middle_word('hello hello')
p middle_word('hello my name is')