# Problem
# Input: Year (e.g. 1991)
# Output: The century correctly appended with the cardinailty rule
# Assume year greater than zero
# Assume valid data entry
# New centuries begin in years that end in 01 (e.g. 1901 - 2000 is 20th century)

# Data Structure
# Input: Integer
# Output: String
# Rules: Hash for cardinality, logic otherwise

# Algorithm
# determine the numerical century of the year
# match the century number with cardinality label
# return the numerical century concatenated with it's cardinality

## Numerical century ###
# divide the year by 100
# if remainder, add 1 to the result
# return the result


## Century Cardinality label
# 1 => st
# 2 => nd
# 3 => rd
# 4, 5, 6, 7, 8, 9 => th
# 10, 11, 12, 13 => th
# match num passed in

## Determine the num to pass in? ##
# check the final digit in the divmod(100)
  # if 0..3 covers, check the preceeding digit
  # else pair it with the hash

# Code
def century_number(num)
  century_array = num.divmod(100)
  if century_array[-1] != 0
    century_array[0] + 1
  else
    century_array[0]
  end
end

def cardinality_label(num)
  cardinalty_hash = {
    [1] => 'st',
    [2] => 'nd',
    [3] => 'rd',
    [4, 5, 6, 7, 8, 9, 10, 11, 12, 13] => 'th'
  }
  label = 'th' # default as its most prominent, but this should not trigger
  cardinalty_hash.each { |key, value| label = value if key.include?(num) }
  label
end

def century(num)
  century_number = century_number(num)
  if (0..3).cover?(century_number % 10)
    cardinality_number = century_number.digits[0, 2].reverse.join.to_i
    if (10..13).cover?(cardinality_number)
      cardinality_label = cardinality_label(cardinality_number)
    else
      cardinality_label = cardinality_label(cardinality_number % 10)
    end
  else
    cardinality_label = cardinality_label(century_number % 10)
  end
  "#{century_number}#{cardinality_label}"
end

# Examples
# puts century_number(1991) == 20
# puts century_number(1791) == 18
# puts century_number(1) == 1
# puts century_number(100) == 1
# puts century_number(101) == 2
# puts century_number(2000) == 20
# puts century_number(2001) == 21
# puts century_number(205478) == 2055
# puts century_number(11201)


# puts cardinality_label(1) == 'st'
# puts cardinality_label(2) == 'nd'
# puts cardinality_label(3) == 'rd'
# puts cardinality_label(4) == 'th'
# puts cardinality_label(9) == 'th'
# puts cardinality_label(12) == 'th'

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
