# Question 1
# I thought NameError, but it retuns nil.
# when you initialize a local variable within an if block, 
# even if that if block doesn’t get executed, the local variable is initialized to nil.

# Question 2
# {a: 'hi there'}
# The hash, like an array, is a collection of references
# informal_greeting references the same underlying object
# as the hash, and that object is mutated by '<<'

# Question 3
# A) one is one, two is two, three is three
# B) one is one, two is two, three is three
# C) one is two, two is three, three is one

# Question 4
=begin
Original code:
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word) # is_an_ip_number? returns true false if in rang 0..255
  end
  return true
end
=end

def is_an_ip_number?(word)
  (0..255).cover?(word.to_i)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false if !is_an_ip_number?(word)
  end
  true
end

puts dot_separated_ip_address?('15.123.48.74') # true
puts dot_separated_ip_address?('15.123.48.74.25') # false
puts dot_separated_ip_address?('15.123.48') # false
puts dot_separated_ip_address?('15.123.308.74') # false
