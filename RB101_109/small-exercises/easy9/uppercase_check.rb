# problem
# take a string argument returns ture if all characters are alphabetic and uppercase
# ignore non alpha characters

# examples
# p uppercase?('t') == false
# p uppercase?('T') == true
# p uppercase?('Four Score') == false
# p uppercase?('FOUR SCORE') == true
# p uppercase?('4SCORE!') == true
# p uppercase?('') == true

# ds/algo
# iterate over each char in the string
# ignore it if its not alpha
# check whether its uppercase
  # if so, continue to the next char
  # else return false

# code
def uppercase?(string)
  chars = string.chars.select { |char| char.match?(/[a-z]/i) }
  chars.all? do |char|
    char == char.upcase
  end
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
