# problem
# given non empty string, check whether it can be constructed
# from a multiple of any substring within it
# string argumet has only lowercase english letters

# examples
# p repeated_substring('abab') == true
# p repeated_substring('aba') == false
# p repeated_substring('aabaaba') == false
# p repeated_substring('abaababaab') == true
# p repeated_substring('abcabcabcabc') == true

# ds/algo
# input -> string
# output -> boolean

# get all substrings
  # initialize an empty array substrings
  # convert string argument into an array of characters
  # iterate over that array
  # take an element 
    # insert it into substrings
    # increment counter
    # insert element + counter elements into array
    # repeat until end of string is reached
  # repeat for every element int he array
  # return substrings

# select testable substrings
# take an array, string
# select from the array, only those substrings where
  # substring length is less than or equal to string length 
  # substring length must be multiple of string length 

# repeated_substring
# get all testatable substrings for string argumet
# check whether any substring in the testable array meets the criteria
  # substring multiplied by the quotient of string length devided by substring length 
  # result is same as string argunment

# code
def all_substrings(string)
  substrings = []
  string_chars = string.chars
  string_chars.each_with_index do |_, index|
    (index...string.length).each do |num|
      substrings << string_chars[index..num].join
    end
  end
  substrings.flatten
end

def testable_subs(arr, string)
  arr.select do |substring|
    substring.length <= (string.length / 2) && string.length % substring.length == 0
  end
end

def repeated_substring(string)
  testable_substrings = testable_subs(all_substrings(string), string)
  testable_substrings.any? do |substring|
    substring * (string.length / substring.length) == string
  end
end

p repeated_substring('abaababaab') == true
p repeated_substring('abab') == true
p repeated_substring('aba') == false
p repeated_substring('aabaaba') == false
p repeated_substring('abaababaab') == true
p repeated_substring('abcabcabcabc') == true
p repeated_substring('') == false
