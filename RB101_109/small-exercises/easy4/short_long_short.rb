# Problem
# Input: 2 Strings
# Output: 1 String
  # Concatenated <shorter><longer><shorter>
# Ok to assum strings are of different lengths

# Examples
# see below

# Data Structure
# Input: String
# Output: String
# Rules:logic

# Algorithm
# Compare string lengths
# Assign the shortest and longest string to short_string and long_string, respectively
# Return <short_string><long_string><short_string>

# Code
def short_long_short(str1, str2)
  short_string = str1
  long_string = str2  
  if str1.length > str2.length
    long_string = str1
    short_string = str2
  end
  short_string + long_string + short_string
end


# examples
puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
