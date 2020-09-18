# problem
# take in a string
# return a hash
  # 3 entries
    # number of lowercase chars
    # number of uppercase chars
    # number of neither

# examples
=begin
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
letter_case_count(' ') == { lowercase: 0, uppercase: 0, neither: 1 }
=end

# ds/algo
# input - string
# output - hash
# initialize an empty hash result_hash
# convert string argument into array of chars
# iterate over the array, run each char through the following conditional
  # if char is lowercase alpha
    # increment lowercase count in result_hash
  # else if char is uppercase alpha
    # increment uppercase count in result_hash
  # else
    # increment neither count in result_hash
# return result_hash

# code
def letter_case_count(string)
  result_hash = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }
  string.chars.each_with_object(result_hash) do |char, hsh|
    if char.match?(/[a-z]/)
      hsh[:lowercase] += 1
    elsif char.match?(/[A-Z]/)
      hsh[:uppercase] += 1
    else
      hsh[:neither] += 1
    end
  end
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
p letter_case_count(' ') == { lowercase: 0, uppercase: 0, neither: 1 }
