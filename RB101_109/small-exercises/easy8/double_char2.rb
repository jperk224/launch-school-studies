# problem
# take in a string
# return a NEW string
# every consonant is doubled
# vowels, digits, punctuation, whitespace should not be doubled

# examples
# p double_consonants('String') == "SSttrrinngg"
# p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") == "JJullyy 4tthh"
# p double_consonants('') == ""

# ds/algo
# initalize an empty string result
# examine each character in the original string argument
  # if consonant append result string with 2x char
  # else apped result with 1x char
# return the result string

# code
def double_consonants(str)
  result = ''
  str.each_char do |char|
    if char.match?(/[a-z&&[^aeiou]]/i)
      result << char * 2
    else
      result << char
    end
  end
  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
