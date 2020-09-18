# problem
# featured number
  # is odd
  # is a multiple of 7
  # digits occur exactly once each

# take in an integer 
# return next featured number greater than argument
# issue error message if there is no next featured number


# examples
=begin
featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
=end

# ds/algo
# is featured
  # check whether argument is odd
  # check whether its multiple of 7
  # convert to array of digits, make sure each digit occurs only once

# code
def is_featured?(int)
  if int.even? || int % 7 != 0
    return false
  else
    digits = int.digits
    digits.none? do |digit|
      digits.count(digit) > 1
    end
  end
end

def featured(int)
  counter = int + 1
  loop do
    break if counter > 1_000_000_000_000
    break if is_featured?(counter)
    counter += 1
  end
  counter
end

# p is_featured?(49)
# p is_featured?(98)
# p is_featured?(97)
# p is_featured?(133)

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
