# problem
# take in a string of all lower cased words and non-alpha characters
# return a new string with all non-alpha characters replaces by spaces
  # there should not be consecutive spaces

# examples
=begin
cleanup("---what's my +*& line?") == ' what s my line '
cleanup("---whats+*&line?") == ' whats line '
cleanup("---what's") == ' what s'
cleanup(" ") == ' '
cleanup("?") == ' '
cleanup("") == ''
cleanup("abcdefg abcdefg abcdefg") == 'abcdefg abcdefg abcdefg'
=end

# ds/algo
# search the string for non-alpha characters
# replace non-alpha characters with space char
# condense consecutive spaces into a single space

# code
def cleanup(string)
  string.gsub(/[^a-z]/, ' ').squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("---whats+*&line?") == ' whats line '
p cleanup("---what's") == ' what s'
p cleanup(" ") == ' '
p cleanup("?") == ' '
p cleanup("") == ''
p cleanup("abcdefg abcdefg abcdefg") == 'abcdefg abcdefg abcdefg'
