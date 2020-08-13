# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

# Understand the problem
# Input => String
# Output => A new String object
# - uppercase all palindrome sub strings in the string
# - empty strings return empty strings
# - assume input will ALWAYS be a string
# - factor in case-sensitivity for palindrome determination
#   - 'mom' is palindrome; 'Mom' is not

##################################################################################################

# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# Understand the problem
=begin
Input => String
Output => Array of Substrings
Explicit Requirements:
- only substrings that are palindromes are an element in the returned array
- palindrome substrings are case sensitive => "adDA" is NOT a palindrome
Implicit Requirements:
- Empty string inputs return empty arrays
Assumptions:
- Input is always of type string
=end

# Data Structure/Algorithm
# Input => String; Output => Array
# 
