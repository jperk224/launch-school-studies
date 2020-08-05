# Write a method that takes two arguments, a string and a positive integer, 
# and prints the string as many times as the integer indicates.
# e.g. repeat('Hello', 3)

def repeat(str, int = 1)
  int.times { puts str }
end

repeat("Hello", 3)
repeat("Hi")
