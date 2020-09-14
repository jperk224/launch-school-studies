# problem
# take in an array and a hash
  # array contains two or more elements, when joined by (' '), produce a person's name
  # hash has 2 keys :title, :occupation
# return a greeting using the person's full name, and metion's person's title and occupation 

# examples
# p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) == "Hello, John Q Doe! Nice to have a Master Plumber around."

# ds/algo
# input: 1 array, 1 hash
# initailze name variable set it equal argument array convertied to string
# string interpolate my greeting with name and title and occupation values from the hash

# code
def greetings(arr, hsh)
  name = arr.join(' ')
  "Hello, #{name}! Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) == "Hello, John Q Doe! Nice to have a Master Plumber around."
p greetings([], {}) == "Hello, ! Nice to have a   around."
