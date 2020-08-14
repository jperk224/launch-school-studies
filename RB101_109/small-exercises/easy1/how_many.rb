# Understand the problem
=begin
- Input => array of varied size
- Count the number of occurences of each element in the array
- Words are case sensitive => 'suv' != 'SUV'
- print out each element and it's count (hash.each)
=end

# Examples/Test Cases
=begin
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
=> 
car => 4
truck => 3
SUV => 1
motorcycle => 2

count = [4, 5, 6, 7, 7, 7, 7] => 
4 => 1
5 => 1
6 => 1
7 => 4

empty_array = [] =>
"no elements in array"

single_word = ['word'] =>
'word' => 1

repeat_word = ['word', 'word', 'word'] =>
'word' => 3
=end

# Data Structures
=begin
- Input => array
- Output => hash (element => count)
- Rules => logic
=end

# Algorithm
=begin
- handle empty array input
- loop through inpur array
  - if element is already a key in the hash, increash the count
  - else, add a key/value=1 pair to the hash for the new key
- loop through the hash and print out key => value
=end

# Code
def count_occurences(array)
  if array.length == 0
    puts "no elements in array"
    return
  end

  occurence_hash = {}

  array.each do |element|
    if occurence_hash[element]
      occurence_hash[element] += 1
    else
      occurence_hash[element] = 1
    end
  end

  occurence_hash.each do |key, value|
    puts "#{key} => #{value}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
count = [4, 5, 6, 7, 7, 7, 7]
empty_array = []
single_word = ['word']
repeat_word = ['word', 'word', 'word']

count_occurences(vehicles)
puts "***************************"
count_occurences(empty_array)
puts "***************************"
count_occurences(single_word)
puts "***************************"
count_occurences(repeat_word)
