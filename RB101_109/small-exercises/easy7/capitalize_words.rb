# problem
# input a string
# output NEW string
  # original argument value, except:
    # the first character of every word is capitalized and others are lower case
# assume words are sequences of non blaonk characters

# examples
=begin
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
word_cap('') == ''
word_cap(' ') == ' '
word_cap('heLLo it is SO nice to mEET "YoU"') == 'Hello It Is So Nice To Meet "YoU"'
=end

# ds/algo
# input - string
# output - string
# convert the string into an array of substrings
  # run each substring through the conditional
    # if the element at the first index is alpha, capitalize the word
    # if the element at the first index is not alpha, don't do anything
# convert the array of converted strings back into a string
# return the new string

# code
def word_cap(string)
  return ' ' if string == ' '
  string.split.map do |substr|
    if substr[0].match?(/[A-Za-z]/)
      substr.capitalize
    else
      substr
    end
  end.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
p word_cap('') == ''
p word_cap(' ') == ' '
p word_cap('heLLo it is SO nice to mEET "YoU"') == 'Hello It Is So Nice To Meet "YoU"'
