=begin
# problem
- take in an array of strings
- return an array of the same strings, with the vowels removed from each string
  - new array
  - strings in the same order
  - strings same-cased

# examples/test cases
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
remove_vowels([]]) == []
remove_vowels([''] == ['']

# data structure(s)
input: array
output: array
rules: logic

# algorithm(s)
1. initialize a local variable no_vowels and assign it to an empty array
2. for each string in the argument array
  a. get a copy of the string
  b. remove the vowels (aeiou)
  c. append string to no_vowels array
3. return the no_vowels array
=end
# code
def remove_vowels(string_array)
  no_vowels = []
  string_array.each do |string|
    no_vowels.append(string.gsub(/[aeiuo]/i, ''))
  end
  no_vowels
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
p remove_vowels([]) == []
p remove_vowels(['']) == ['']
