# problem
# take in a string
# return a hash with 3 entries
  # percentage of lowercase
  # percentage of uppercase
  # precentage of neither

# examples
=begin
letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
letter_percentages('ABCDefgh') == { lowercase: 50, uppercase: 50, neither: 0 }
letter_percentages('ABCD') == { lowercase: 0, uppercase: 100, neither: 0 }
letter_percentages('zzzz') == { lowercase: 100, uppercase: 0, neither: 0 }
letter_percentages('zzzz+123') == { lowercase: 50, uppercase: 0, neither: 50 }
letter_percentages('ZZZZ+1234') == { lowercase: 0, uppercase: 50, neither: 50 }
letter_percentages(' ') == { lowercase: 0, uppercase: 0, neither: 100 }
=end

#ds/algo
# initialize my hash result with appropriate keys
# initialize total_characters set to the number of chars in string
# initialize lower_count
  # set to count of lowercase chars in string
# initialize upper_count
  # set to count of uppercase chars in string
# initilize neither_count
  # count chars in string that are neither
# set hash value equalt to associative percentages

# code
def letter_percentages(string)
  result_hash = Hash.new(0)
  total_characters = string.length.to_f
  lower_count = string.chars.select { |char| char.match?(/[a-z]/) }.length
  upper_count = string.chars.select { |char| char.match?(/[A-Z]/) }.length
  neither_count = string.chars.select { |char| char.match?(/[^A-Za-z]/) }.length
  result_hash[:lowercase] = (lower_count / total_characters) * 100
  result_hash[:uppercase] = (upper_count / total_characters) * 100
  result_hash[:neither] = (neither_count / total_characters) * 100
  new_hash = Hash.new(0)
  result_hash.each_with_object(new_hash) do |(key, value), hsh|
    if value % 1 != 0
      new_hash[key] = value.round(1)
    else
      new_hash[key] = value.to_i
    end
  end
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('ABCDefgh') == { lowercase: 50, uppercase: 50, neither: 0 }
p letter_percentages('ABCD') == { lowercase: 0, uppercase: 100, neither: 0 }
p letter_percentages('zzzz') == { lowercase: 100, uppercase: 0, neither: 0 }
p letter_percentages('zzzz+123') == { lowercase: 50, uppercase: 0, neither: 50 }
p letter_percentages('ZZZZ1234') == { lowercase: 0, uppercase: 50, neither: 50 }
p letter_percentages(' ') == { lowercase: 0, uppercase: 0, neither: 100 }
