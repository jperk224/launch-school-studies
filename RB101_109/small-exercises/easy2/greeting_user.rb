# Problem
# Input: user's name
# Output: String (upcase if input appended with !)

# Data Structure
# Input: String
# Output: String
# Rules: Logic

# Algorithm
# Ask user for name
# If name appended with !, return upcase special greeting, else Hello name

# Code
def greeting(name)
  if name[-1] == '!'
    return "Hello #{name[0, (name.length - 1)]}. Why are we screaming?".upcase
  else
    return "Hello #{name}."
  end
end

# Test cases
p greeting('Bob') == 'Hello Bob.'
p greeting('Bob!') == 'HELLO BOB. WHY ARE WE SCREAMING?'
