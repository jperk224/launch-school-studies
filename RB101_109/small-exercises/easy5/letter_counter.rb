=begin
# Problem
- take in a string with one or more space-separated words
- return a hash that shows the count of words of different sizes
- words consist of any string of characters that don't include a space

# Examples
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

# Data Structure
input: string
output: hash
rules: logic/looping

# Algorithms
1. split the string into an array of words
2. for each word
  - count the characters in the word (i.e. length)
  - if this count already exists in the hash, increase the count
  - else add an entry to the hash
3. return the hash
=end
# Code
def word_sizes(string)
  string.split.each_with_object({}) do |word, hash|
    stripped_word = word.gsub(/[^a-z]/i, '')
    count = stripped_word.length
    if hash.keys.include?(count)
      hash[count] += 1
    else
      hash[count] = 1
    end
  end
end

# p word_sizes('Four s-core and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
