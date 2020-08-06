# Understand the problem
=begin
- take in a string
- return a new string with the order of words reversed
  - words themselves are NOT reversed
=end

# Examples/Test Cases
=begin
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('Hello') == 'Hello'
puts reverse_sentence('a') == 'a'
puts reverse_sentence('B') == 'B'
puts reverse_sentence('APPLE LOGS') == 'LOGS APPLE'
=end

# Data Structure(s)
=begin
- input => string
- output => string
- rules => logic
=end

# Algorithm
=begin
- convert the string to an array
- reverse the array
- convert the array to string
=end

# Code
def reverse_sentence(string)
  return string.split(" ").reverse.join(" ")
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('Hello') == 'Hello'
puts reverse_sentence('a') == 'a'
puts reverse_sentence('B') == 'B'
puts reverse_sentence('APPLE LOGS') == 'LOGS APPLE'
