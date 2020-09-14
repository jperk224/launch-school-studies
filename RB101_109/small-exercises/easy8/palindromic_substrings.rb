# problem
# take in a string
# return a list of all substrings that are palindromic
# return values should be in same sequence as the substrings appear in the string
# dupe palindromes should be included multiple times
# assume single case chars are not palindromes  


# examples



# ds/algo
# is palindrome?
  # take in a string
  # convert the string to an array
  # copy the array
  # reverse the copy
  # return true/false whether original arr is equal to reversed copy

# list of substrings
  # initalize an empty array substrings
  # initalize a counter set to 0
  # take the substring spanning first element in the array up to counter and inject it into substrings array
  # increment counter
  # repeat until end of stirng is reached

# all substrings
  # initlaize an array final_list
  # initialize a counter set to 0
  # get substring spanning form counter to end of string
  # pass substring to substrings_list
  # inject result into final_list
  # increment counter
  # repeat until end of string is reached
  # convert final_list to one-dimensional array

# palindromes
  # convert string into array of subs using all_substrings
  # select only those substrings that are palindromes

# code
def is_palindrome?(str)
  return false if str.length <= 1
  string_array = str.chars.map { |char| char.downcase }
  string_array_alpha = string_array.select do |char|
    char.match?(/[a-z]/i)
  end
  reversed_array = string_array_alpha.clone
  reversed_array.reverse!
  string_array_alpha == reversed_array && string_array_alpha.length > 1
end

def substrings_list(str)
  substrings = []
  counter = 0
  loop do
    break if counter >= str.length
    substrings << str[0..counter]
    counter += 1
  end
  substrings
end

def all_substrings(str)
  final_list = []
  counter = 0
  loop do
    break if counter >= str.length
    substring = str[counter..(str.length - 1)]
    final_list << substrings_list(substring)
    counter +=1
  end
  final_list.flatten
end

def palindromes(str)
  substring_list = all_substrings(str)
  substring_list.select do |substr|
    is_palindrome?(substr)
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') #== [
 # 'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
 # 'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
 # '-madam-', 'madam', 'ada', 'oo'
#]
p palindromes('knitting cassettes') #== [
 # 'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
#]

p is_palindrome?('Abcba') == true
p is_palindrome?('Abc-?ba') == true