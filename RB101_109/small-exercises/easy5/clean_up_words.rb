=begin
# Problem
- given a string of all lowercased words and non-alpha characters
- return the string with all non-alpha characters replaced by spaces
  - If one or more non-alpha characters occur in succession, replace the full set with a single space

# Examples
cleanup("---what's my +*& line?") == ' what s my line '
cleanup("") == ''
cleanup(" ") == ' '
cleanup("a") == 'a'
cleanup("almost  ") == 'almost  '
cleanup("almost ? ") == 'almost   '

# Data Structure(s)
Input: String
Output: String
Rules: Logic

# Algorithm
1. Split the string into an array of substrings
2. Run character conversion method on each substring
3. join the substrings back together into a single string
4. return the string

## Character conversion
1. examine the string for a regex of one or more special characters
2. replace the special characters with a single space

=end
# Code
# def cleanup(string)
#   string.gsub(/[^a-z]/i, ' ').squeeze(' ')
# end

ALPHABET = ('a'..'z').to_a

def cleanup(string)
  clean_chars = []
  string.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end
  clean_chars.join('')
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("") == ''
p cleanup(" ") == ' '
p cleanup("a") == 'a'
p cleanup("almost ") == 'almost '
p cleanup("almost ?") == 'almost '
