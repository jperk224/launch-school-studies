# Understand the problem
=begin
- input => single string argument
- output => given string where substrings with length >= 5 are reversed
- only include spaces where one or more word is present
=end

# Examples/Test Cases
=begin
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
puts reverse_words('')                      # => ''
puts reverse_words('A')                     # => 'A'
puts reverse_words('b')                     # => 'b'
=end

# Data Structure(s)
=begin
- input => string
- output => string
- rules => logic/helper function
=end

# Algorithm
=begin
- turn the string into an array and loop through it.  
- If a given element is greater 4 characters, reverse it
- return the new string with reversed substrings
=end

# Code
def should_reverse? (string, length)
  if string.length >= length
    return string.reverse
  else
    return string
  end
end

def reverse_words(string)
  return string.split.map { |element| should_reverse?(element, 5) }.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
puts reverse_words('')                      # => ''
puts reverse_words('A')                     # => 'A'
puts reverse_words('b')                     # => 'b'
