# Problem
# Input: String
# Output: Integer
  # Count of non-space chars

# Examples
# walk => 4
# walk, don't run => 13 -> all non-space chars are counted

# Data Structure
# Input: String
# Output: String interpolated with chars
# Rules: Logic

# Algorithm
# Get string from user
# Store string in user_string var
# Strip all whitespace
# count the chars
# return the count

# Code
print "Please write word or multiple words: "
user_string = gets.chomp
char_count = user_string.gsub(/\s+/, '').length
puts "There are #{char_count} characters in \"#{user_string}\""
