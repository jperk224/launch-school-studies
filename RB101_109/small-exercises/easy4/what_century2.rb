# problem
# take in a year as input
# return the appropriate century
  # string with appropriate century number concatenated with appropriate 'st' 'nd' 'rd' 'th'
# new centurites end in years that begin in '01'

# examples
=begin
century(1000) == '10th'
century(1001) == '11th'
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
=end


# ds/algo
# input: positive int > 0
# output: string

# century_number
# divide the int input input by 100
  # if remainder add one to century returned
  # if no remained return result

# century
  # create a map that maps numbers to suffix
    # account for 11th 12th 13th 
  # special case array with values 11, 12, 13
    # run int thorugh century_number
  # take the result
    # if in special case array return map value
    # mod the reult by 10 to get last digit
    # get map value for that last digit
  # return result concatenated with map value
  

# code
def century_number(int)
  result = int.divmod(100)
  if result[-1] != 0
    result[0] += 1
  end
  result[0]
end

def century(int)
  special_cases = [11, 12, 13]
  suffix_map = {
    0 => 'th',
    1 => 'st',
    2 => 'nd',
    3 => 'rd',
    4 => 'th',
    5 => 'th',
    6 => 'th',
    7 => 'th',
    8 => 'th',
    9 => 'th',
    11 => 'th',
    12 => 'th',
    13 => 'th',
  }
  result = century_number(int)
  result_test = result % 100
  result_test %= 10 unless special_cases.include?(result_test)
  suffix = suffix_map[result_test]
  result.to_s + suffix
end

p century(1000) == '10th'
p century(1001) == '11th'
p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
p century(111201) == '1113th'
p century(5195) == '52nd'
