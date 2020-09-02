=begin
# problem
- take in a string as an argument
- return a NEW string
  - every uppercase letter is replaced by its lowercase version
  - lowercase replaced by uppercase
  - all other characters remain unchanged
- cannot use #swapcase method

# examples/ test cases
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# data structure
Input: string
Output: string

# algorithm(s)
- create an array of swaped case characters from the original string argument
- join the array back into a string
- return the string

# swap case method
- see if an array of letters includes the argument
- if not, return the argument
- if so, swap case

=end
# code

require 'pry'

def swap_char_case(char)
  lower_letters = ('a'..'z').to_a
  upper_letters = ('A'..'Z').to_a
  total_letters = lower_letters + upper_letters
  if total_letters.include?(char)
    letter = char.downcase if upper_letters.include?(char)
    letter = char.upcase if lower_letters.include?(char)
    letter
  else
    char
  end
end

def swapcase(string)
  swapped_case_array = string.chars.map do |char|
    swap_char_case(char)
  end
  swapped_case_array.join('')
end

p swap_char_case('A')
p swap_char_case('a')
p swap_char_case('-')
p swap_char_case('')

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
