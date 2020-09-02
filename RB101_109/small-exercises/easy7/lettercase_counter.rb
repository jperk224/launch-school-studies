=begin
# problem
- take a string argument
- return a hash with 3 ENTRIES
  1. the number of lowercase characters
  2. the number of uppercase characters
  3. the number of characters that are neither


# examples/test cases
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }


# data structure(s)
Input: String
Output: Hash

# algorithm(s)
- Initialize an empty count_hash hash with a default value of 0 (for quick addition)
- convert the string argument to an array of chars
- iterate over the array, for each iteration
  - if the char matches its lowerscase version, increment the lowercase count
  - if the char matches its uppercase version, increment the uppercase count
  - else increment the neither count
- return count_hash 
=end
# code
def letter_case_count(string)
  count_hash = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }
  string.chars.each do |char|
    if char.to_s.to_i == char
      count_hash[:neither] += 1
    else
      if char == char.downcase
        count_hash[:lowercase] += 1
      elsif char == char.upcase
        count_hash[:uppercase] += 1
      else
        count_hash[:neither] += 1
      end
    end
  end
  count_hash
end

p letter_case_count('abCdef 123') #== { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') #== { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') #== { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
