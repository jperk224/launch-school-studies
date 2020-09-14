# problem
# take a string as an argument
# return an array
  # contains every word in the string, apended by a space, followed by word length
  # can count non-alpha characters
  # assume each word is separated by space

# examples
# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# p word_lengths("baseball hot dogs and apple pie") == ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# p word_lengths("Supercalifragilisticexpialidocious") == ["Supercalifragilisticexpialidocious 34"]

# p word_lengths("") == []

# ds/algo
# convert the string into an array of each substring
# initialize an empty result array
# iterate over the substring array
  # find the length of the substring
  # insert substring and length into the result array
# return result

# code
def word_lengths(str)
  result = []
  substrings = str.split
  substrings.each do |substring|
    result << "#{substring} #{substring.length}"
  end
  result
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
p word_lengths("baseball hot dogs and apple pie") == ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") == ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
