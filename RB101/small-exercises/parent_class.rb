s = 'abc'
puts s.public_methods.inspect

# How would you modify this code to print just the public methods that are defined or overridden by the String class?

puts s.public_methods(false).inspect
