# problem
# take in a positive integer (i.e. > 0)
# returns the number with its digits reversed

# examples
# reversed_number(12345) == 54321
# reversed_number(12213) == 31221
# reversed_number(456) == 654
# reversed_number(12000) == 21 # No leading zeros in return value!
# reversed_number(12003) == 30021
# reversed_number(1) == 1

# ds/algo
# convert the int into an array of its digits
# create a new array of just the digits that are not leading zeros
  # if the number at the index prior to the zero is nil don't include it --> it's a leading zero
# joint the array into a single string
# convert the string into an int

# code
def reversed_number(int)
  digit_array = int.digits
  new_array = []
  int.digits.each_with_index do |num, idx|
    next if digit_array[idx - 1] == nil
    new_array << num
  end
  new_array.join.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
