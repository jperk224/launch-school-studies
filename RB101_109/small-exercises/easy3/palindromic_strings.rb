# Problem



# Data Structure


# Algorithm
# Take in a string
# convert the string into an array of characters
# test whether the arry is equal to the array in revers

# Code
# def palindrome?(str)
#   str.chars == str.chars.reverse
# end

# Further exploration
def palindrome?(input)
  input == input.reverse
end

# Examples
puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
puts palindrome?([1, 2, 3, "string"]) == false
puts palindrome?([1, 2, 3, 2, 1]) == true