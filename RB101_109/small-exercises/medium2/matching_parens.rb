# problem
# take in a string
# return true if all parens are properly balanced (i.e. '(' paird with '(')
  # properly balanced means starts with '(' and ends with ')'

# examples/tests
=begin
balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false
balanced?('((What) (is this))?') == true
=end

# ds/algo
# convert the string into an array of chars
# pull out just the parens from the array into a new array

# inside the iteration
  # check whether first paren is left paren (stop iterating is it is not and return false)
  # if paren is left increment left_counter
  # if paren is right
    # if previous paren was right, check that left counter > right_counter, if not, stop iterating
    # else increment right_counter
  # return whether left_counter = right_counter

# code
def balanced?(string)
  chars = string.chars
  parens = chars.select { |char| char == '(' || char == ')' }
  left_counter = 0
  right_counter = 0
  parens.each do |paren|
    left_counter += 1 if paren == '('
    if paren == ')'
      if left_counter <= right_counter
        return false
      else
        right_counter += 1
      end
    end
  end
  left_counter == right_counter
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('((What) (is this))?') == true
